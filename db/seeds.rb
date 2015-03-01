# create fake data env for development
unless Rails.env.production?
  100.times do
    FactoryGirl.create(:service_order)
  end

  # create about us info
  Page.create(
    name: 'About Us',
    content: Faker::Lorem.paragraph
  )
end

# create default_admin user
AdminUser.create(
  email: 'admin@tenluaweb.info',
  password: '12345678'
)

