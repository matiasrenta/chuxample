class ProfileObra < ActiveRecord::Base
  has_one :project_activity, as: :profile, dependent: :destroy
  validates :contrato, :calle, presence: true
  validates :cantidad, :importe, :avance_programado, :avance_real, numericality: true
end
