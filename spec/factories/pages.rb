include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :page do
    name "page-name"
    content Faker::Lorem.paragraph
  end
end
