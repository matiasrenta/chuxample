class VerificationPhoto < ActiveRecord::Base
  belongs_to :verification

  validates :name, :date_and_time, presence: true

  # todo: quitar este metodo, es para probar hasta que se tenga la app movil
  before_validation do
    self.date_and_time = Time.now if self.date_and_time.blank?
  end

end
