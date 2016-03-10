class CatPgdAreaOfOpportunity < ActiveRecord::Base
  belongs_to :cat_pgd_axi

  validates :key, :description, :cat_pgd_axi_id, presence: true
  validates :key, uniqueness: true
end
