Role.seed_once(:name) do |r|
  r.name = "superuser"
  r.list_order = 1
end

Role.seed_once(:name) do |r|
  r.name = "Administrador"
  r.list_order = 2
end

Role.seed_once(:name) do |r|
  r.name = "Ejecutor General"
  r.list_order = 3
end
Role.seed_once(:name) do |r|
  r.name = "Ejecutor Adquisición"
  r.list_order = 4
end
Role.seed_once(:name) do |r|
  r.name = "Ejecutor Nómina"
  r.list_order = 5
end
Role.seed_once(:name) do |r|
  r.name = "Ejecutor Obra"
  r.list_order = 6
end
Role.seed_once(:name) do |r|
  r.name = "Ejecutor Social"
  r.list_order = 7
end

Role.seed_once(:name) do |r|
  r.name = "Revisor"
  r.list_order = 8
end

Role.seed_once(:name) do |r|
  r.name = "Visor"
  r.list_order = 9
end

Role.seed_once(:name) do |r|
  r.name = "Transparentador"
  r.list_order = 9
end

Role.seed_once(:name) do |r|
  r.name = "Verificador Delegacional"
  r.list_order = 10
end

Role.seed_once(:name) do |r|
  r.name = "Verificador Ciudadano"
  r.list_order = 11
end
