class CatFonYearDocument < ActiveRecord::Base
  has_many :cat_fon_funds, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, uniqueness: true
end
