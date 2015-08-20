class Admin::SettingsController < Admin::ApplicationController
  def index
    # to get all items for render list
    @settings = Settings.unscoped
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
    else
      eval("Settings.#{params[:settings][:var]} = #{params[:settings][:value]}")
      redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_created")
    end
  end

  def update
    eval("Settings.#{params[:settings][:var]} = #{params[:settings][:value]}")
    redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_updated")
  end

  def destroy
    eval("Settings.destroy :#{params[:id]}")
    redirect_to admin_settings_path, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

  def setting_params
    params.require(:settings).permit(:var, :value)
  end

end
