class Beneficiary < ActiveRecord::Base
  belongs_to :territorial_unit
  belongs_to :project_activity_social

  validates :apellido_paterno, :nombres, :territorial_unit_id, :sexo, :fecha_nacimiento, :domicilio, :curp, presence: true
  validates :territorial_unit_id, numericality: true

  scope :to_17, -> {where(fecha_nacimiento: 17.years.ago..Date.today)}
  scope :from_18_to_29, -> {where(fecha_nacimiento: 29.years.ago..17.years.ago)}
  scope :from_30_to_59, -> {where(fecha_nacimiento: 59.years.ago..29.years.ago)}
  scope :from_60, -> {where('fecha_nacimiento < ?', 59.years.ago)}


  def full_name
    "#{nombres} #{apellido_paterno} #{apellido_materno}"
  end

  def edad
    now = Time.now.utc
    now.year - fecha_nacimiento.year - (fecha_nacimiento.to_time.change(year: now.year) > now ? 1 : 0)
  end

end
