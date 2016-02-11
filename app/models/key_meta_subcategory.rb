class KeyMetaSubcategory < ActiveRecord::Base
  has_many :key_meta_titles, dependent: :destroy
  belongs_to :key_meta_category

  validates :name, presence: true
  validates :name, uniqueness: true
end
