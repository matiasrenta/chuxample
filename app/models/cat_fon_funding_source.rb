class CatFonFundingSource < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :cat_fon_funds, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, uniqueness: true

  def to_label
    "#{key} - #{description}"
  end

end
