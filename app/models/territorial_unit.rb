class TerritorialUnit < ActiveRecord::Base
  has_many :beneficiaries, dependent: :restrict_with_error
  validates :code, :name, presence: true
  validates :code, :name, uniqueness: true
end
