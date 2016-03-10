class CatGenAxi < ActiveRecord::Base
  validates :key, :description, presence: true
  validates :key, uniqueness: true
end
