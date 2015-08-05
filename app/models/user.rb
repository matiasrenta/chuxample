require 'valid_email'

class User < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: [:create, :update, :destroy]
  tracked owner: ->(controller, model) {controller.try(:current_user)}
  #tracked recipient: ->(controller, model) { model.xxxx }
  tracked :params => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes}
          }

  belongs_to :role
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :validatable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :timeoutable, :lockable

  validates :email, email: {message: I18n.t('errors.messages.invalid_email')}, mx: {message: I18n.t('errors.messages.invalid_mx')}






  # sobreescribí este metodo de Devise solo para poder enviar un subject distinto para el mail de bienvenida y el de reset pasword instruction
  def send_reset_password_instructions(subject = nil)
    if subject.nil?
      subject = sign_in_count == 0 ? I18n.t('devise.mailer.welcome.subject') : I18n.t('devise.mailer.reset_password_instructions.subject')
    end
    token = set_reset_password_token
    send_reset_password_instructions_notification(token, subject)
    token
  end

  protected

    # sobreescribí este metodo de Devise solo para poder enviar un subject distinto para el mail de bienvenida y el de reset pasword instruction
    def send_reset_password_instructions_notification(token, subject)
      opt = {}
      opt = {subject: subject} if subject
      send_devise_notification(:reset_password_instructions, token, opt)
    end

end

