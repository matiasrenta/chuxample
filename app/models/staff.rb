class Staff < ActiveRecord::Base
	include PublicActivity::Model
  tracked only: [:create, :update, :destroy]
  tracked :on => {update: proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).size > 0 }}
  tracked owner: ->(controller, model) {controller.try(:current_user)}
  #tracked recipient: ->(controller, model) { model.xxxx }
  tracked :on => {:update => proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).keys.size > 0 }}
  tracked :parameters => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes.except(*model.except_attr_in_public_activity)},
              :model_label => proc {|controller, model| model.try(:name)}
          }


  belongs_to :ascription
  belongs_to :job_title
  has_many :paysheets, dependent: :restrict_with_error

  validates :apellido_paterno, :nombres, :sexo, :fecha_nacimiento, :job_title_id, :domicilio, :curp, presence: true
  validates :job_title_id, numericality: true

  def to_label
    "#{curp} - #{nombres} #{apellido_paterno} #{apellido_materno}"
  end

  def except_attr_in_public_activity
    [:id, :updated_at]
  end

end
