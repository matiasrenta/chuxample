class ThingsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :thing_params

  # GET /things
  def index
    @things = do_index(Thing, params)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /things/1
  def show
    @new_comment = Comment.build_from(@thing, current_user.id, '')
  end

  # GET /things/new
  def new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  def create

    if @thing.save
      redirect_to @thing, notice: t('simple_form.flash.successfully_created')
    else
      generate_flash_msg_no_keep(@thing)
      render :new
    end
  end

  # PATCH/PUT /things/1
  def update
    if @thing.update(thing_params)
      notify_other_user # todo: esto es una prueba de notificaciones, quitar cuando se implemente algo real
      redirect_to @thing, notice: t('simple_form.flash.successfully_updated')
    else
      generate_flash_msg_no_keep(@thing)
      render :edit
    end
  end

  # DELETE /things/1
  def destroy
    @thing.destroy
    redirect_to things_url, notice: t('simple_form.flash.successfully_destroyed')
  end

  private

  # Only allow a trusted parameter "white list" through.
  def thing_params
    params.require(:thing).permit({thing_attaches_files: []}, {thing_attaches_attributes: [:_destroy, :id]}, {thing_contacts_attributes: [:_destroy, :id, :name, :field1, :field2, :field3]}, {thing_part_ids: []}, :name, :age, :price, :expires, :discharged_at, :description, :published, :gender, :thing_category_id)
  end

  def notify_other_user
    if current_user.email == 'matias@opi.la'
      reciever = User.find_by_email('matiasrenta@mail.com')
    else current_user.email == 'matiasrenta@mail.com'
      reciever = User.find_by_email('matias@opi.la')
    end
    current_user.send_message(reciever, "#{current_user.name} modificó la cosa #{view_context.link_to(@thing.name, thing_path(@thing), class: 'display-normal')}", '<span></span>')
  end

end
