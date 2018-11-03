json.extract! user, :id, :furst_name, :last_name, :phone, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
