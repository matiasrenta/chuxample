class CatDerStrategy < ActiveRecord::Base
  has_many :key_analyticals, dependent: :restrict_with_error
  has_many :cat_der_line_of_actions, dependent: :destroy
  belongs_to :cat_der_human_right

  validates :key, :description, :cat_der_human_right_id, presence: true
  validates :key, uniqueness: true
end
