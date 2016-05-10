class CatPprParChaptersController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :cat_ppr_par_chapter_params

  # GET /cat_ppr_par_chapters
  def index
    @cat_ppr_par_chapters = do_index(CatPprParChapter, params)
  end

  # GET /cat_ppr_par_chapters/1
  def show
  end

  # GET /cat_ppr_par_chapters/new
  def new
  end

  # GET /cat_ppr_par_chapters/1/edit
  def edit
  end

  # POST /cat_ppr_par_chapters
  def create

    if @cat_ppr_par_chapter.save
      redirect_to @cat_ppr_par_chapter, notice: t("simple_form.flash.successfully_created")
    else
      generate_flash_msg_no_keep(@cat_ppr_par_chapter)
      render :new
    end
  end

  # PATCH/PUT /cat_ppr_par_chapters/1
  def update
    if @cat_ppr_par_chapter.update(cat_ppr_par_chapter_params)
      redirect_to @cat_ppr_par_chapter, notice: t("simple_form.flash.successfully_updated")
    else
      generate_flash_msg_no_keep(@cat_ppr_par_chapter)
      render :edit
    end
  end

  # DELETE /cat_ppr_par_chapters/1
  def destroy
    if @cat_ppr_par_chapter.destroy
      redirect_to cat_ppr_par_chapters_url, notice: t("simple_form.flash.successfully_destroyed")
    else
      generate_flash_msg(@cat_ppr_par_chapter)
      redirect_to :back
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cat_ppr_par_chapter_params
      params.require(:cat_ppr_par_chapter).permit(:key, :description)
    end
end
