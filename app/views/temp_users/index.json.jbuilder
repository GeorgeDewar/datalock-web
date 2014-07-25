json.array!(@temp_users) do |temp_user|
  json.extract! temp_user, :id, :name, :pin, :expiry_at
  json.url temp_user_url(temp_user, format: :json)
end
