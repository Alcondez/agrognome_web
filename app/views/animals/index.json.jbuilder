json.array!(@animals) do |animal|
  json.extract! animal, :id, :usuario_id, :paddock_id, :provider_id, :fecha_compra, :fecha_venta, :genero, :cria
  json.url animal_url(animal, format: :json)
end
