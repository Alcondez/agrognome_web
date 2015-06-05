json.array!(@users) do |user|
  json.extract! user, :id, :email, :fecha_registro, :password, :username, :id_user
  json.url user_url(user, format: :json)
end
