class SocialDevelopmentProgramsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :social_development_program_params

  # GET /social_development_programs
  def index
    @social_development_programs = do_index(SocialDevelopmentProgram, params)
  end

  # GET /social_development_programs/1
  def show
  end

  # GET /social_development_programs/new
  def new
  end

  # GET /social_development_programs/1/edit
  def edit
  end

  # POST /social_development_programs
  def create

    if @social_development_program.save
      redirect_to @social_development_program, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@social_development_program)
      render :new
    end
  end

  # PATCH/PUT /social_development_programs/1
  def update
    if @social_development_program.update(social_development_program_params)
      redirect_to @social_development_program, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@social_development_program)
      render :edit
    end
  end

  # DELETE /social_development_programs/1
  def destroy
    if @social_development_program.destroy
      redirect_to social_development_programs_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@social_development_program)
      redirect_to social_development_programs_url
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def social_development_program_params
      params.require(:social_development_program).permit(:name)
    end
end
