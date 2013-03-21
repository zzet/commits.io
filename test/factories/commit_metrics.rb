FactoryGirl.define do
  factory :commit_metric do
    metric
    commit
    data { generate :string }
    user
    rate { generate :float }
    metric_count { generate :integer }
  end
end
