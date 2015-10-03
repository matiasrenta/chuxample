class PublicActivityController < ApplicationController
  authorize_resource except: :index#, param_method: :thing_params

  def index
    authorize!(:read, PublicActivity::Activity)
    set_content_title('fa-fw fa fa-video-camera', ['Public Activity'])
    per_page = params[:per_page].blank? ? 10 : params[:per_page].to_i
    @q = PublicActivity::Activity.order('id desc').ransack(params[:q])
    public_activities = @q.result(distinct: true)
    @activities = public_activities.paginate(:page => params[:page].blank? ? 1 : params[:page], :per_page => per_page)
  end
end
