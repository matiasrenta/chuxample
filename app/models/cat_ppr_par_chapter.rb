class CatPprParChapter < ActiveRecord::Base
  validates :key, :description, presence: true
  validates :key, :description, uniqueness: true
end
