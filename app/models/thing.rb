class Thing < ActiveRecord::Base
	include PublicActivity::Model
	tracked only: [:create, :update, :destroy]
	tracked owner: ->(controller, model) {controller.try(:current_user)}
	#tracked recipient: ->(controller, model) { model.xxxx }
  tracked :params => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes}
          }

	#has_many :documents, as: :attachable#, dependent: :destroy
	#accepts_attachments_for :documents, attachment: :file
	#accepts_nested_attributes_for :documents, allow_destroy: true

	has_many :thing_contacts, dependent: :destroy
	has_many :thing_attaches, dependent: :destroy
	has_and_belongs_to_many :thing_parts, join_table: 'things_thing_parts'

	accepts_nested_attributes_for :thing_contacts, allow_destroy: true
	accepts_attachments_for :thing_attaches, attachment: :file, append: true
	accepts_nested_attributes_for :thing_attaches, allow_destroy: true

	validates_presence_of :name
end
