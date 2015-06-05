json.array!(@paddocks) do |paddock|
  json.extract! paddock, :id, :usuario_id, :nombre_potrero, :info_extra, :max_cap, :capacidad_actual
  json.url paddock_url(paddock, format: :json)
end
