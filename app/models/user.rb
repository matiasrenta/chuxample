class User < ActiveRecord::Base
  belongs_to :role
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :validatable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :timeoutable, :lockable
end
