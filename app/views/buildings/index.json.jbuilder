json.array!(@buildings) do |building|
  json.extract! building, :id, :building_name, :latitute, :longitude, :description, :delete_flag
  json.url building_url(building, format: :json)
end
