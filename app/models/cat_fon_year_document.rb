class CatFonYearDocument < ActiveRecord::Base
  validates :key, :description, presence: true
  validates :key, uniqueness: true
end
