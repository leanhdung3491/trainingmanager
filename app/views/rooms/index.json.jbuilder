json.array!(@rooms) do |room|
  json.extract! room, :id, :room_name, :building_id, :status
  json.url room_url(room, format: :json)
end
