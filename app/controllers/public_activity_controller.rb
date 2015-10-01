class PublicActivityController < ApplicationController
  authorize_resource except: :index#, param_method: :thing_params

  def index
    authorize!(:read, PublicActivity::Activity)
    set_content_title('fa-fw fa fa-video-camera', ['Public Activity'])
    @activity = PublicActivity::Activity.first
  end
end
