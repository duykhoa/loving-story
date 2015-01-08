FactoryGirl.define do
  factory :service_order do
    email Faker::Internet.email
    his_name Faker::Name.name
    her_name Faker::Name.name
    his_story Faker::Lorem.paragraph
    her_story Faker::Lorem.paragraph
    status ServiceOrder.statuses.fetch(:pending)
  end
end
