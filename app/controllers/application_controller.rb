#require 'will_paginate/array'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def index
    render 'layouts/application'
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

  def borrame
    per_page = params[:per_page].blank? ? 30 : params[:per_page].to_i
    @q = PublicActivity::Activity.order('id desc').ransack(params[:q])
    public_activities = @q.result(distinct: true)
    @public_activities = public_activities.paginate(:page => params[:page].blank? ? 1 : params[:page], :per_page => per_page)
    @pagination = { :total => @public_activities.total_entries, :page => @public_activities.current_page, :per_page => per_page}
    respond_with({public_activities: @public_activities, pagination: @pagination})
  end


end
