json.array!(@notification_receivers) do |notification_receiver|
  json.extract! notification_receiver, :id, :notification_id, :receiver_id, :status, :notification_id
  json.url notification_receiver_url(notification_receiver, format: :json)
end
