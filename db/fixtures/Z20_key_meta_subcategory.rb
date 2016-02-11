KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'Estructura por Resultados'
end

KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'Estructura Administrativa'
  kms.key_meta_category_id = KeyMetaCategory.find_by_name('Centro Gestor').id
end

KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'Casificación Funcional'
  kms.key_meta_category_id = KeyMetaCategory.find_by_name('Área Funcional').id
end
KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'ER'
  kms.key_meta_category_id = KeyMetaCategory.find_by_name('Área Funcional').id
end
KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'Programa Presupuestario'
  kms.key_meta_category_id = KeyMetaCategory.find_by_name('Área Funcional').id
end

KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'Programa Presupuestario'
  kms.key_meta_category_id = KeyMetaCategory.find_by_name('Área Funcional').id
end

KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'Fondo'
  kms.key_meta_category_id = KeyMetaCategory.find_by_name('Estructura Económica').id
end
KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'Posición Presupuestal'
  kms.key_meta_category_id = KeyMetaCategory.find_by_name('Estructura Económica').id
end
KeyMetaSubcategory.seed_once(:name) do |kms|
  kms.name = 'Proyecto de Inversión'
  kms.key_meta_category_id = KeyMetaCategory.find_by_name('Estructura Económica').id
end