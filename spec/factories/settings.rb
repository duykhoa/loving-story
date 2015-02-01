FactoryGirl.define do
  factory :setting do
    key Faker::Name.name
    value Faker::Lorem.paragraph
  end
end
