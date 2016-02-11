class KeyMetaTitle < ActiveRecord::Base
  has_many :key_meta_values, dependent: :destroy
  belongs_to :key_meta_subcategory

  validates :name, :abbreviation, :key_meta_subcategory_id, presence: true
  validates :name, :abbreviation, uniqueness: true
end
