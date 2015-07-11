#require 'will_paginate/array'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_cache_buster
  before_action :authenticate_user!
  before_action :set_content_title #, :set_user_language


  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def access_denied
    set_content_title(t("screens.labels.access_denied"))
  end

  def action_controller_error
    if current_user
      raise ActiveRecord::RecordNotFound.new("Probably a routing error")
    else
      redirect_to new_user_session_path
    end
  end

  protected ####################################### PROTECTED ###################################################

  def set_content_title(title = nil)
    if title.nil?
      if action_name == "index"
        title = [t("activerecord.models.#{controller_name.singularize}", count: 2)]
      else
        title = [t("activerecord.models.#{controller_name.singularize}", count: 1), t("activerecord.actions.#{action_name}")]
      end
    end
    #session["content_title"]
    @content_title = title[0] if title.size == 1
    @content_title = "#{title[0]} <span>> #{title[1]} </span>" if title.size == 2
  end

  def set_user_language
    I18n.locale = user_signed_in? ? current_user.local.to_sym : I18n.default_locale
  end

  def do_index(model, params, collection = nil, default_order = false, paginate = true, order_by = nil, includes = nil)
    authorize!(:read, model)
    search_algoritm

    if default_order
      @q = model.accessible_by(current_ability, :read).ransack(params[:q])
    elsif params[:q] && params[:q][:meta_sort]
      @q = model.unscoped.accessible_by(current_ability, :read).ransack(params[:q])
    elsif order_by
      @q = model.unscoped.order(order_by).accessible_by(current_ability, :read).ransack(params[:q]) unless includes
      @q = model.unscoped.includes(includes).order(order_by).accessible_by(current_ability, :read).ransack(params[:q]) if includes
    else
      @q = model.unscoped.order("updated_at DESC, created_at DESC").accessible_by(current_ability, :read).ransack(params[:q])
    end

    nodel_collection = @q.result(distinct: true)
    if paginate
      nodel_collection.paginate(:page => params[:page], :per_page => per_page(params[:per_page]))
    else
      nodel_collection.all
    end
  end

  def search_algoritm
    params[:q] = nil if params[:search_clear]
    if params[:q]
      params[:q].each do |param|
        unless param[1].blank?
          @filter_active = true;
          break
        end
      end
    end
  end

  def per_page(quantity)
    if !quantity.blank?
      cookies[:per_page] = {:value => quantity, :expires => 30.days.from_now}
    elsif cookies[:per_page].blank?
      cookies[:per_page] = {:value => "20", :expires => 30.days.from_now} #default 20 per page
    end
    params[:per_page] = cookies[:per_page]
    cookies[:per_page]
  end

  def generate_alert_msg(model_instance)
    if model_instance.errors.any?
      if model_instance.errors.count > 1
        "#{model_instance.errors.count} #{t('screens.errors.many_errors')}: #{(model_instance.errors.include?(:base) && model_instance.errors.get(:base).kind_of?(String)) ? model_instance.errors.get(:base) : model_instance.errors.get(:base).join(". ")}"
      else
        "#{model_instance.errors.count} #{t('screens.errors.one_error')}: #{model_instance.errors.get(:base)}"
      end
    end
  end

  private ############################################ PRIVATE #################################################

  def after_sign_out_path_for(user)
    new_user_session_path
  end

  rescue_from Exception, :with => :render_500
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to "/application/access_denied", :alert => t("screens.labels.access_denied")
  #end

  def render_404(exception)
    set_content_title(t("screens.errors.not_found_404"))
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'error', status: 404 }
      format.all { render :nothing => true, :status => 404 }
    end
  end

  def render_500(exception)
    set_content_title(t("screens.errors.internal_server_error_500"))
    @msg = exception.message + " -- Clase: "
    @backtrace_html = exception.backtrace.join("<br/>")
    backtrace_log = exception.backtrace.join("\n")
    logger.info @msg
    logger.info backtrace_log
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'error', status: 500 }
      format.all { render :nothing => true, :status => 500 }
    end
    #ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver #para que me notifique por mail en production
  end

end

