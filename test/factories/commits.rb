# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :commit do
    sha "MyString"
    parent_sha "MyString"
    repository
    committer
    diff "MyText"
  end
end
