json.array!(@customers) do |customer|
  json.extract! customer, :id, :usuario_id, :sell_id, :nombre_cliente, :documento_fiscal, :telefono, :direccion, :email, :estado
  json.url customer_url(customer, format: :json)
end
