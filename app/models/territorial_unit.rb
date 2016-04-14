class TerritorialUnit < ActiveRecord::Base
  validates :code, :name, presence: true
  validates :code, :name, uniqueness: true
end
