class Role < ActiveRecord::Base
  has_many :api_users, dependent: :restrict_with_error
  has_many :users, dependent: :restrict_with_error

  def self.revisor
    find_by_name 'Revisor'
  end

  def superuser?
    name == 'superuser'
  end

  def ejecutor_adquisicion?
    name == 'Ejecutor Adquisición'
  end

  def ejecutor_nomina?
    name == 'Ejecutor Nómina'
  end

  def ejecutor_obra?
    name == 'Ejecutor Obra'
  end

  def ejecutor_social?
    name == 'Ejecutor Social'
  end


end
