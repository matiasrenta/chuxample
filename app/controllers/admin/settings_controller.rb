class Admin::SettingsController < Admin::ApplicationController
  def index
    authorize!(:read, Settings)
    search_algoritm
    if params[:q] && params[:q][:meta_sort]
      @q = Settings.unscoped.accessible_by(current_ability, :read).ransack(params[:q])
    else
      @q = Settings.unscoped.order("updated_at DESC, created_at DESC").accessible_by(current_ability, :read).ransack(params[:q])
    end
    nodel_collection = @q.result(distinct: true)
    @settings = nodel_collection.paginate(:page => params[:page], :per_page => per_page(params[:per_page]))
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

  def new
    @setting = Settings.new
    @setting.value = ''
  end

  def edit
    @setting = Settings.unscoped.find(params[:id])
  end

  def create
    @setting = Settings.new(setting_params)
    if Settings.unscoped.exists?(var: params[:settings][:var])
      @setting.errors.add(:var, "ya esta en uso")
      render :new
    elsif params[:settings][:var].present? && params[:settings][:value].present?
      value = params[:settings][:value]
      if value.starts_with?('[', '{') || ((value.to_i != 0 && !value.starts_with?('0')) || (value.to_i == 0 && value.starts_with?('0')))
        eval("Settings.#{params[:settings][:var]} = #{params[:settings][:value]}")
      else
        eval("Settings.#{params[:settings][:var]} = '#{params[:settings][:value]}'") if params[:settings][:value].instance_of? String
      end
      redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_created")
      return
    else
      flash[:alert] = 'fields can not be blank'
      render :edit
    end
  end

  def update
    if params[:settings][:value].present?
      value = params[:settings][:value]
      if value.starts_with?('[', '{') || ((value.to_i != 0 && !value.starts_with?('0')) || (value.to_i == 0 && value.starts_with?('0')))
        eval("Settings.#{params[:settings][:var]} = #{params[:settings][:value]}")
      else
        eval("Settings.#{params[:settings][:var]} = '#{params[:settings][:value]}'") if params[:settings][:value].instance_of? String
      end
      redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_updated")
      return
    else
      @setting = Settings.unscoped.find_by_var(params[:settings][:var])
      flash[:alert] = 'value can not be blank'
      render :edit
    end
  end

  def destroy     if @thing.destroy       redirect_to things_url, notice: t("simple_form.flash.successfully_destroyed")     else       generate_flash_msg(@thing)        redirect_to things_url     end
    eval("Settings.destroy :#{params[:id]}")
    redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

  def setting_params
    params.require(:settings).permit(:var, :value)
  end

end
