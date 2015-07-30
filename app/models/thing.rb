class Thing < ActiveRecord::Base
	include PublicActivity::Model
	tracked only: [:create, :update, :destroy]
	tracked owner: ->(controller, model) {controller.try(:current_user)}
	#tracked recipient: ->(controller, model) { model.xxxx }
  tracked :params => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes}
          }
end
