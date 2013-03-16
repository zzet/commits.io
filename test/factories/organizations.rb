FactoryGirl.define do
  factory :organization do
    name
    company { generate(:string) }
  end
end
