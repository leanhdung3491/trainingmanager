json.array!(@member_classes) do |member_class|
  json.extract! member_class, :id, :full_name, :birthday, :email
  json.url member_class_url(member_class, format: :json)
end
