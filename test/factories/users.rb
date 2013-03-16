FactoryGirl.define do
  factory :user do
    email
    name
    login { generate :string }
    password { generate :string }
    image { generate :name }

    trait :admin do
      admin true
    end

    trait :reg do
      personal_data_processing "1"
    end

    after(:create) do |u|
      create :registered_committer, user: u
    end
  end
end
