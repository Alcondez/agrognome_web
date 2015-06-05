json.array!(@sells) do |sell|
  json.extract! sell, :id, :usuario_id, :fecha_compra, :peso_final, :monto, :estado, :cantidad
  json.url sell_url(sell, format: :json)
end
