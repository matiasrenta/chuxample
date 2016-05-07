class Verification < ActiveRecord::Base
  belongs_to :project_activity_obra

  belongs_to :user
  has_many :verification_photos, dependent: :destroy

  accepts_nested_attributes_for :verification_photos

  validates :user_id, :project_activity_obra_id, :question, :evaluation, presence: true
  validates :user_id, :project_activity_obra_id, :question, :evaluation, numericality: true
  validates :status, numericality: true, if: 'status'
end
