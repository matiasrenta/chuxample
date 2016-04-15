class Beneficiary < ActiveRecord::Base
  belongs_to :territorial_unit
  belongs_to :project_activity_social

  validates :apellido_paterno, :nombres, :territorial_unit_id, :sexo, :edad, :fecha_nacimiento, :domicilio, :curp, presence: true
  validates :territorial_unit_id, numericality: true
  validates :edad, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 130 }

  def full_name
    "#{nombres} #{apellido_paterno} #{apellido_materno}"
  end
end
