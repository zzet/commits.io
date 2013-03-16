FactoryGirl.define do
  factory :badge do
    name
    description { generate :string }
    image { generate :string }
  end
end
