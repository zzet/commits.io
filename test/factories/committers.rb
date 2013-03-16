FactoryGirl.define do
  factory :committer do
    name
    email

    factory :committer_from_organization do
      organization
    end

    factory :registered_committer do
      user
      email { |c| c.user.email }
    end

    after(:create) do |c|
      create :repository_owned_by_committer, ownerable: c
    end
  end
end
