class State < ActiveRecord::Base
  has_many :suppliers, dependent: :restrict_with_error
  has_many :towns, dependent: :restrict_with_error
  validates :name, presence: true
  validates :name, uniqueness: true
end
