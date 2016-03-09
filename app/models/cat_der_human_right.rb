class CatDerHumanRight < ActiveRecord::Base
  has_many :cat_der_strategies, dependent: :destroy
  validates :key, :description, presence: true
  validates :key, uniqueness: true
end
