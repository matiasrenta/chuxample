class Role < ActiveRecord::Base
  has_many :users, dependent: :restrict_with_error

  def superuser?
    name == 'superuser'
  end

end
