FactoryGirl.define do
  factory :commit_metric do
    metric
    commit
    data { generate :string }
    user
    percent { generate :integer }
  end
end
