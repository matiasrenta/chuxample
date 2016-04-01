class CatDerLineOfAction < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  belongs_to :cat_der_strategy

  validates :key, :description, :cat_der_strategy_id, presence: true
  validates :key, uniqueness: true
end
