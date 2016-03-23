class StatesController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :state_params

  # GET /states
  def index
    @states = do_index(State, params)
  end

  # GET /states/1
  def show
  end

  # GET /states/new
  def new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  def create

    if @state.save
      redirect_to @state, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@state)
      render :new
    end
  end

  # PATCH/PUT /states/1
  def update
    if @state.update(state_params)
      redirect_to @state, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@state)
      render :edit
    end
  end

  # DELETE /states/1
  def destroy
    @state.destroy
    redirect_to states_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def state_params
      params.require(:state).permit(:name, :abbreviation)
    end
end
