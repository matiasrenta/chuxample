class JobTitle < ActiveRecord::Base
  has_many :staffs, dependent: :restrict_with_error
  validates :name, presence: true
  validates :name, uniqueness: true
end
