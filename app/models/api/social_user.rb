class SocialUser < ActiveRecord::Base
  validates :provider, :uid, :json_data, presence: true
  validates :uid, numericality: true
end
