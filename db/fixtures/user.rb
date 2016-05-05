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
  s.role_id = Role.find_by_name('Administrador').id
end

User.seed_once(:email) do |s|
  s.email = "revisor@mail.com"
  s.name = "Revisor"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Revisor').id
end

User.seed_once(:email) do |s|
  s.email = "ejecutor.adquisicion@mail.com"
  s.name = "ejecutor.adquisicion"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Ejecutor Adquisición').id
end

User.seed_once(:email) do |s|
  s.email = "ejecutor.general@mail.com"
  s.name = "ejecutor.general"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Ejecutor General').id
end

User.seed_once(:email) do |s|
  s.email = "visor@mail.com"
  s.name = "visor"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Visor').id
end

User.seed_once(:email) do |s|
  s.email = "verificador.delegacional@mail.com"
  s.name = "verificador.delegacional"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Verificador Delegacional').id
end

User.seed_once(:email) do |s|
  s.email = "verificador.ciudadano@mail.com"
  s.name = "verificador.ciudadano"
  s.password = 'opiopiopi'
  s.password_confirmation = 'opiopiopi'
  s.role_id = Role.find_by_name('Verificador Ciudadano').id
end
