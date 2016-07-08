json.type 'FeatureCollection'
json.features @activities_obras do |ao|
  json.type 'Feature'
  json.properties do
    json.name ao.name
    json.colonia ao.colonia
    json.direccion ao.full_address
    json.admin ao.project_obra.cat_are_area.description
    json.ejercicio 'NA'
    json.comprometido 'NA'
    json.pagado 'NA'
    json.periodo 'NA'
  end
  json.geometry do
    json.type 'Point'
    json.coordinates [ao.longitude, ao.latitude]
  end
end