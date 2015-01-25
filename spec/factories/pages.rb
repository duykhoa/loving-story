FactoryGirl.define do
  factory :page do
    name Faker::Name.name
    content Faker::Lorem.paragraph
    slug Faker::Name.name
  end

end
