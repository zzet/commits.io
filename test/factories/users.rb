FactoryGirl.define do
  factory :user do
    email
    password { generate :string }
    name { generate :name }
    image { generate :name }

    trait :admin do
      admin true
    end

    trait :reg do
      personal_data_processing "1"
    end
  end
end
