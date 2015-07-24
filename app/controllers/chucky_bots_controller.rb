class ChuckyBotsController < ApplicationController
  load_and_authorize_resource except: :index, param_method: :chucky_bot_params

  # GET /chucky_bots
  def index
    @chucky_bots = do_index(ChuckyBot, params)
  end

  # GET /chucky_bots/1
  def show
  end

  # GET /chucky_bots/new
  def new
    #convierto los role names en keys con values nil en una hash
    @chucky_bot.authorization = Hash[Role.all.pluck(:name).map {|key| [key, nil]}]
    @chucky_bot.public_activity = {actions: nil, notes: nil}
  end

  # GET /chucky_bots/1/edit
  def edit
  end

  # POST /chucky_bots
  def create
    if @chucky_bot.save
      redirect_to @chucky_bot, notice: t("screens.notice.successfully_created")
    else
      render :new
    end
  end

  # PATCH/PUT /chucky_bots/1
  def update
    if @chucky_bot.update(chucky_bot_params)
      redirect_to @chucky_bot, notice: t("screens.notice.successfully_updated")
    else
      render :edit
    end
  end

  # DELETE /chucky_bots/1
  def destroy
    @chucky_bot.destroy
    redirect_to chucky_bots_url, notice: t("screens.notice.successfully_destroyed")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def chucky_bot_params
      params.require(:chucky_bot).permit(:underscore_model_name, :i18n_singular_name, :i18n_plural_name, :migrate,
                                         {authorization: Role.all.pluck(:name).concat([:notes])},
                                         {public_activity: [:actions, :notes]},
                                         {fields_attributes: [:name, :field_type, :i18n_name, :_destroy, :id,
                                                              formats_options: [:index, :show, :all],
                                                              validations_options: [:notes, validates: []],
                                                              association_options: [:no_relationize, :drop_down_type, :dependent_on_parent] ]}
      )
    end
end
