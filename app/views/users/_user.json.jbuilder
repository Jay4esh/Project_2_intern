json.extract! user, :id, :name, :position, :created_at, :updated_at
json.url user_url(user, format: :json)
