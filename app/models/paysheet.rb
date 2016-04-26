class Paysheet < ActiveRecord::Base
  belongs_to :project_activity_nomina
  belongs_to :ascription
  belongs_to :job_title
  belongs_to :staff

  validates :staff_id, :importe, :project_activity_nomina_id, presence: true
  validates :staff_id, :importe, :project_activity_nomina_id, numericality: true

  before_save :set_job_and_ascription

  private

  def set_job_and_ascription
    self.job_title_id = self.staff.job_title_id
    self.ascription_id = self.staff.ascription_id
  end
end
