FactoryGirl.define do
  factory :repository_owned_by_committer, class: 'Repository' do
    name
    path { generate(:string) }
    association :ownerable, factory: :committer
  end

  factory :repository_owned_by_organization, class: 'Repository' do
    name
    path { generate(:string) }
    association :ownerable, factory: :organization
  end
end
