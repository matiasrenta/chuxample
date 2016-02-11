class KeyMetaValue < ActiveRecord::Base
  belongs_to :key_meta_title

  validates :key_value, :key_description, :key_meta_title_id, presence: true
end
