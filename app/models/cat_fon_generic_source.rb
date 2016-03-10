class CatFonGenericSource < ActiveRecord::Base
  has_many :cat_fon_funds, dependent: :restrict_with_error
  validates :key, :description, presence: true
  #la key no es única
  validates :description, uniqueness: true
end
