json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :usuario_id, :sell_id, :customer_id, :fecha_factura, :monto, :estado, :cantidad, :nombre, :direccion, :telefono
  json.url invoice_url(invoice, format: :json)
end
