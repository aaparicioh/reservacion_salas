json.extract! user, :id, :email, :password, :password_confirmation
json.url usuario_url(usuario, format: :json)
