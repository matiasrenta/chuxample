KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Eje'
  kmt.abbreviation = 'EJE'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Estructura por Resultados'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Enfoque de gasto'
  kmt.abbreviation = 'EG'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Estructura por Resultados'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Resultado'
  kmt.abbreviation = 'R'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Estructura por Resultados'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Subresultado'
  kmt.abbreviation = 'SR'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Estructura por Resultados'
end


KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Año'
  kmt.abbreviation = 'Año'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Estructura Administrativa'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Sector'
  kmt.abbreviation = 'Sector'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Estructura Administrativa'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Subsector'
  kmt.abbreviation = 'SB'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Estructura Administrativa'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Unidad Responsable'
  kmt.abbreviation = 'UR'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Estructura Administrativa'
end



KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Finalidad'
  kmt.abbreviation = 'FI'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Casificación Funcional'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Función'
  kmt.abbreviation = 'F'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Casificación Funcional'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Subfunción'
  kmt.abbreviation = 'SF'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Casificación Funcional'
end



KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Actividad Institucional'
  kmt.abbreviation = 'AI'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'ER'
end


KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Modalidad y Número consecutivo'
  kmt.abbreviation = 'PP'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Programa Presupuestario'
end


KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Fuente de Financiamiento'
  kmt.abbreviation = 'FF'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Fondo'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Fuente Genérica'
  kmt.abbreviation = 'FG'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Fondo'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Fuente Específica'
  kmt.abbreviation = 'FE'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Fondo'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Año del Documento'
  kmt.abbreviation = 'AD'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Fondo'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Origen del Recurso'
  kmt.abbreviation = 'OR'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Fondo'
end



KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Partida'
  kmt.abbreviation = 'PTDA'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Posición Presupuestal'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Tipo de Gasto'
  kmt.abbreviation = 'TG'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Posición Presupuestal'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Dígito Identificador'
  kmt.abbreviation = 'DI'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Posición Presupuestal'
end
KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Destino de Gasto'
  kmt.abbreviation = 'DG'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Posición Presupuestal'
end



KeyMetaTitle.seed_once(:name) do |kmt|
  kmt.name = 'Número de Proyecto'
  kmt.abbreviation = 'PY'
  kmt.key_meta_subcategory_id = KeyMetaSubcategory.find_by_name 'Proyecto de Inversión'
end
