unless Rails.env.production?
  10.times do
    FactoryGirl.create(:service_order)
  end
end
