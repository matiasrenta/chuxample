class CatPprParConceptsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ppr_par_concept_params

  # GET /cat_ppr_par_concepts
  def index
    @cat_ppr_par_concepts = do_index(CatPprParConcept, params)
  end

  # GET /cat_ppr_par_concepts/1
  def show
  end

  # GET /cat_ppr_par_concepts/new
  def new
  end

  # GET /cat_ppr_par_concepts/1/edit
  def edit
  end

  # POST /cat_ppr_par_concepts
  def create

    if @cat_ppr_par_concept.save
      redirect_to @cat_ppr_par_concept, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ppr_par_concept)
      render :new
    end
  end

  # PATCH/PUT /cat_ppr_par_concepts/1
  def update
    if @cat_ppr_par_concept.update(cat_ppr_par_concept_params)
      redirect_to @cat_ppr_par_concept, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ppr_par_concept)
      render :edit
    end
  end

  # DELETE /cat_ppr_par_concepts/1
  def destroy
    @cat_ppr_par_concept.destroy
    redirect_to cat_ppr_par_concepts_url, notice: t("simple_form.flash.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ppr_par_concept_params
      params.require(:cat_ppr_par_concept).permit(:key, :description, :cat_ppr_par_chapter_id)
    end
end
