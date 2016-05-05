User.seed_once(:email) do |s|
  s.email = "matias@opi.la"
  s.name = "Matias Renta"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = 1
end


User.seed_once(:email) do |s|
  s.email = "administrador@mail.com"
  s.name = "Administrador"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Administrador')
end

User.seed_once(:email) do |s|
  s.email = "revisor@mail.com"
  s.name = "Revisor"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Revisor')
end

User.seed_once(:email) do |s|
  s.email = "ejecutor.adquisicion@mail.com"
  s.name = "ejecutor.adquisicion"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Ejecutor Adquisición')
end

User.seed_once(:email) do |s|
  s.email = "ejecutor.general@mail.com"
  s.name = "ejecutor.general"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Ejecutor General')
end

User.seed_once(:email) do |s|
  s.email = "visor@mail.com"
  s.name = "visor"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Visor')
end

User.seed_once(:email) do |s|
  s.email = "verificador.delegacional@mail.com"
  s.name = "verificador.delegacional"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Verificador Delegacional')
end

User.seed_once(:email) do |s|
  s.email = "verificador.ciudadano@mail.com"
  s.name = "verificador.ciudadano"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Verificador Ciudadano')
end
