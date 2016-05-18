class Role < ActiveRecord::Base
  has_many :api_users, dependent: :restrict_with_error
  has_many :users, dependent: :restrict_with_error

  def superuser?
    name == 'superuser'
  end

end
