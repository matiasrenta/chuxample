class Admin::SettingsController < Admin::ApplicationController
  def index
    authorize!(:read, Sett)
    search_algoritm
    if params[:q] && params[:q][:meta_sort]
      @q = Sett.unscoped.accessible_by(current_ability, :read).ransack(params[:q])
    else
      @q = Sett.unscoped.order("updated_at DESC, created_at DESC").accessible_by(current_ability, :read).ransack(params[:q])
    end
    model_collection = @q.result(distinct: true)
    @settings = model_collection.paginate(:page => params[:page], :per_page => per_page(params[:per_page]))
  end

  def new
    authorize!(:create, Sett)
    @setting = Sett.new
    @setting.value = ''
  end

  def edit
    authorize!(:update, Sett)
    @setting = Sett.unscoped.find(params[:id])
  end

  def create
    authorize!(:create, Sett)
    @setting = Sett.new(setting_params)
    if Sett.unscoped.exists?(var: params[:admin_settings][:var])
      @setting.errors.add(:var, "ya esta en uso")
      render :new
    elsif params[:admin_settings][:var].present? && params[:admin_settings][:value].present?
      value = params[:admin_settings][:value]
      if value.starts_with?('[', '{') || ((value.to_i != 0 && !value.starts_with?('0')) || (value.to_i == 0 && value.starts_with?('0')))
        eval("Sett.#{params[:admin_settings][:var]} = #{params[:admin_settings][:value]}")
      else
        eval("Sett.#{params[:admin_settings][:var]} = '#{params[:admin_settings][:value]}'") if params[:admin_settings][:value].instance_of? String
      end
      redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_created")
      return
    else
      flash[:alert] = 'fields can not be blank'
      render :edit
    end
  end

  def update
    authorize!(:update, Sett)
    if params[:admin_settings][:value].present?
      value = params[:admin_settings][:value]
      if value.starts_with?('[', '{') || ((value.to_i != 0 && !value.starts_with?('0')) || (value.to_i == 0 && value.starts_with?('0')))
        eval("Sett.#{params[:admin_settings][:var]} = #{params[:admin_settings][:value]}")
      else
        eval("Sett.#{params[:admin_settings][:var]} = '#{params[:admin_settings][:value]}'") if params[:admin_settings][:value].instance_of? String
      end
      redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_updated")
      return
    else
      @setting = Sett.unscoped.find_by_var(params[:admin_settings][:var])
      flash[:alert] = 'value can not be blank'
      render :edit
    end
  end

  def destroy
    authorize!(:destroy, Sett)
    eval("Sett.destroy :#{params[:id]}")
    redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

  def setting_params
    params.require(:admin_settings).permit(:var, :value)
  end

  def search_algoritm
    if params[:search_clear]
      params[:q] = nil
      params[:search_clear] = nil
    end

    if params[:q]
      params[:q].each do |param|
        unless param[1].blank? || param[0] == 's' # la 's' es para que no se ponga rojo cuando solo se hace sort de columnas
          @filter_active = true;
          break
        end
      end
    end
  end

  def per_page(quantity)
    if !quantity.blank?
      params[:per_page] = quantity
    elsif cookies[:per_page].blank?
      params[:per_page] = 20
    end
    params[:per_page]
  end

end
