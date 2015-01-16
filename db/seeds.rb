# create fake data env for development
unless Rails.env.production?
  20.times do
    FactoryGirl.create(:service_order)
  end
end

# create default_admin user
AdminUser.create(
  email: 'admin@tenluaweb.info',
  password: '12345678'
)
