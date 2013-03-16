FactoryGirl.define do
  factory :commit_metric do
    metric
    commit
    data { generate :string }
    user
  end
end
