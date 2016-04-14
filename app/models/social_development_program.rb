class SocialDevelopmentProgram < ActiveRecord::Base
  has_many :project_activity_socials, dependent: :restrict_with_error
  validates :name, presence: true
  validates :name, uniqueness: true
end
