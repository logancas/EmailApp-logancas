json.extract! user, :id, :email_address, :first_name, :last_name, :password_hash, :created_at, :updated_at
json.url user_url(user, format: :json)
