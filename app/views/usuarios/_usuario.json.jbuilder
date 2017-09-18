json.extract! usuario, :id, :nick, :pass, :nombre, :appat, :apmat, :tipo_usuario, :autorizado, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
