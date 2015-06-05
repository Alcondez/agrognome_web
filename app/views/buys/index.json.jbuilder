json.array!(@buys) do |buy|
  json.extract! buy, :id,:fecha_compra, :peso_compra, :monto, :estado, :unidad, :id_proveedor, :id_compra
  json.url buy_url(buy, format: :json)
end
