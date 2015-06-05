json.array!(@profiles) do |profile|
  json.extract! profile, :id, :usuario_id, :nombre, :direccion, :email, :telefono, :bsf_por_kg
  json.url profile_url(profile, format: :json)
end
