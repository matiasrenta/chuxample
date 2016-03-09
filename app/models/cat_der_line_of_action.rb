class CatDerLineOfAction < ActiveRecord::Base
  belongs_to :cat_der_strategy

  validates :key, :description, :cat_der_strategy_id, presence: true
  validates :key, uniqueness: true
end
