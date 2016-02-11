class KeyMetaCategory < ActiveRecord::Base
  has_many :key_meta_subcategories, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
end
