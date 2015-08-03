require 'valid_email'

class User < ActiveRecord::Base
  belongs_to :role
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :validatable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :timeoutable, :lockable

  validates :email, email: {message: I18n.t('errors.messages.invalid_email')}, mx: {message: I18n.t('errors.messages.invalid_mx')}

end
