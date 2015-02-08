FactoryGirl.define do
  factory :setting do
    sequence(:key) { |i| "Key#{i}" }
    value Faker::Lorem.paragraph
  end
end
