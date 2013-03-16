# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :commit do
    sha { generate(:string) }
    parent_sha { generate(:string) }
    repository { create :repository_owned_by_organization }
    committer
    diff { generate(:string) }
    message { generate(:string) }
  end
end
