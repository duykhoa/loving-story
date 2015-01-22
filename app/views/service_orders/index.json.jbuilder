json.array!(@service_orders) do |service_order|
  json.extract! service_order, :id, :email, :his_name, :her_name, :his_story, :her_story, :status
  json.url service_order_url(service_order, format: :json)
end
