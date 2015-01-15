FactoryGirl.define do
  factory :service_order do
    email Faker::Internet.email
    his_name Faker::Name.name
    her_name Faker::Name.name
    his_story Faker::Lorem.paragraph
    her_story Faker::Lorem.paragraph
    our_relationship Faker::Lorem.paragraph
    your_name Faker::Name.name
    header_image Faker::Avatar.image
    status ServiceOrder.statuses.fetch(:pending)
  end
end
