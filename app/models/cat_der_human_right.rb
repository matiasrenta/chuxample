class CatDerHumanRight < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :cat_der_strategies, dependent: :destroy
  validates :key, :description, presence: true
  validates :key, uniqueness: true
end
