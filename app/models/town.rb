class Town < ActiveRecord::Base
  has_many :suppliers, dependent: :restrict_with_error
  belongs_to :state

  validates :name, :state_id, presence: true
  validates :state_id, numericality: true
end
