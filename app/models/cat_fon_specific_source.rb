class CatFonSpecificSource < ActiveRecord::Base
  validates :key, :description, presence: true
  # la key en este caso no es única
  validates :description, uniqueness: true
end
