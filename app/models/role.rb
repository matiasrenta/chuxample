class Role < ActiveRecord::Base
  has_many :users

  def superuser?
    name == 'superuser'
  end

end
