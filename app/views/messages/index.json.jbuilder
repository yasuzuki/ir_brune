json.array!(@messages) do |message|
  json.extract! message, :id, :device_id, :name, :description, :format, :freq, :data
  json.url message_url(message, format: :json)
end
