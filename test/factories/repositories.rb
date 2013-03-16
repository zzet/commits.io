FactoryGirl.define do
  factory :repository_owned_by_committer, class: 'Repository' do
    name
    path { generate(:string) }
    source { generate(:url) }
    clone_url { generate(:url) }
    association :ownerable, factory: :committer
    is_fork false

    trait :fork do
      is_fork true
    end
  end

  factory :repository_owned_by_organization, class: 'Repository' do
    name
    path { generate(:string) }
    source { generate(:url) }
    clone_url { generate(:url) }
    association :ownerable, factory: :organization
    is_fork false

    trait :fork do
      is_fork true
    end
  end
end
