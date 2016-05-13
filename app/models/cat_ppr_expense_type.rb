class CatPprExpenseType < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  validates :key, :description, presence: true
  validates :key, :description, uniqueness: true

  def to_label
    "#{key} - #{description}"
  end

end
