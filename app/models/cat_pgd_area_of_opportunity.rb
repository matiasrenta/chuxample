class CatPgdAreaOfOpportunity < ActiveRecord::Base
  has_many :cat_pgd_objectives, dependent: :restrict_with_error
  belongs_to :cat_pgd_axi

  validates :key, :description, :cat_pgd_axi_id, presence: true
  validates :key, uniqueness: true
end
