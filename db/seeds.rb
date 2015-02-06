# create fake data env for development
unless Rails.env.production?
  20.times do
    FactoryGirl.create(:service_order)
  end

  #create about us info
  Page.create(
    name: 'About Us',
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )
end

# create default_admin user
AdminUser.create(
  email: 'admin@tenluaweb.info',
  password: '12345678'
)

