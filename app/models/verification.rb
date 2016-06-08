class Verification < ActiveRecord::Base
  belongs_to :project_activity_obra
  belongs_to :verification_owneable, polymorphic: true
  has_many :verification_photos, dependent: :destroy

  accepts_nested_attributes_for :verification_photos, allow_destroy: true

  attr_accessor :photos # esto es para que la app movil envia este parametro con un string que sea el json de toddas las fotos. para que sea mas facil de programar en la app

  #validates :verification_owneable_id, :verification_owneable_type, :project_activity_obra_id, :answer, :evaluation, :status, presence: true
  #validates :verification_owneable_id, :project_activity_obra_id, :answer, :evaluation, :status, numericality: true

  validates :project_activity_obra_id, :answer, :evaluation, :status, presence: true
  validates :project_activity_obra_id, :answer, :evaluation, :status, numericality: true


  validates :answer, inclusion: 0..1
  validates :evaluation, inclusion: 1..5
  validates :status, inclusion: -1..1

end
