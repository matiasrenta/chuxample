class SocialUser < ActiveRecord::Base
  has_many :verifications, as: :verification_owneables, dependent: :restrict_with_error

  validates :provider, :uid, :json_data, presence: true
  validates :uid, numericality: true
end
