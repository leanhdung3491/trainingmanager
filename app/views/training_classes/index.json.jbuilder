json.array!(@training_classes) do |training_class|
  json.extract! training_class, :id, :class_name, :star_date, :end_date, :course_name
  json.url training_class_url(training_class, format: :json)
end
