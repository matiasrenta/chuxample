json.array!(@things) do |thing|
  json.extract! thing, :id, :name, :age, :price, :expires, :discharged_at, :description
  json.url thing_url(thing, format: :json)
end
