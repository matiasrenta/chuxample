class Verification < ActiveRecord::Base
  belongs_to :project_activity_obra

  belongs_to :user
  has_many :verification_photos, dependent: :destroy

  accepts_nested_attributes_for :verification_photos

  validates :user_id, :project_activity_obra_id, :answer, :evaluation, :status, presence: true
  validates :user_id, :project_activity_obra_id, :answer, :evaluation, :status, numericality: true

  validates :answer, inclusion: 0..1
  validates :evaluation, inclusion: 1..5
  validates :status, inclusion: -1..1

end
