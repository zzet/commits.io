FactoryGirl.define do
  factory :metric do
    name
    description { generate :string }
  end
end
