FactoryGirl.define do
  factory :organization do
    name
    company { generate(:string) }

    after(:create) do |o|
      create :repository_owned_by_organization, ownerable: o
    end
  end
end
