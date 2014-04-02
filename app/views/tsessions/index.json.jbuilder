json.array!(@tsessions) do |tsession|
  json.extract! tsession, :id, :class_name, :subject_name, :room_name, :user_id, :start_time, :end_time, :status
  json.url tsession_url(tsession, format: :json)
end