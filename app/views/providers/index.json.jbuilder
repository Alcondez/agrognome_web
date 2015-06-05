json.array!(@providers) do |provider|
  json.extract! provider, :id, :usuario_id, :buy_id, :nombre, :documento_fiscal, :telefono, :direccion, :email, :estado
  json.url provider_url(provider, format: :json)
end
