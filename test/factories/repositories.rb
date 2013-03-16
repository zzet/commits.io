FactoryGirl.define do
  factory :repository_owned_by_commiter, class: 'Repository' do
    name
    path { generate(:string) }
    association :owner, factory: :commiter
  end

  factory :repository_owned_by_organization, class: 'Repository' do
    name
    path { generate(:string) }
    association :owner, factory: :organization
  end
end
