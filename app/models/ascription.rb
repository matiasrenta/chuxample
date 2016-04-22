class Ascription < ActiveRecord::Base
  has_many :project_activity_nominas, dependent: :restrict_with_error
  validates :name, presence: true
  validates :name, uniqueness: true
end
