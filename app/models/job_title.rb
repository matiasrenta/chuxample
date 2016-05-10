class JobTitle < ActiveRecord::Base
  has_many :paysheets, dependent: :restrict_with_error
  has_many :staffs, dependent: :restrict_with_error
  validates :name, presence: true
  validates :name, uniqueness: true
end
