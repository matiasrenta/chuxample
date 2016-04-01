class SuppliersController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :supplier_params

  # GET /suppliers
  def index
    @suppliers = do_index(Supplier, params)
  end

  # GET /suppliers/1
  def show
  end

  # GET /suppliers/new
  def new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  def create

    if @supplier.save
      redirect_to @supplier, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@supplier)
      render :new
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@supplier)
      render :edit
    end
  end

  # DELETE /suppliers/1
  def destroy
    @supplier.destroy
    redirect_to suppliers_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.require(:supplier).permit(:rfc, :razon_social, :name, :calle, :nro_exterior, :nro_interior, :entre_calles, :state_id, :town_id, :codigo_postal, :observaciones)
    end
end
