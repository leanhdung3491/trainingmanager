json.array!(@subjects) do |subject|
  json.extract! subject, :id, :subject_name, :subject_code, :description, :category_id, :delete_flag
  json.url subject_url(subject, format: :json)
end
