# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: 'test', login: 'test', email: 'test@test.com')
committer = Committer.create(name: 'test', email: 'test@test.com', user_id: user.id)

repository = Repository.new
repository.name = 'commits.io'
repository.path = '/tmp'
repository.ownerable = committer
repository.save

Metric.kind.values.each do |metric|
  Metric.create name: metric.humanize, kind: metric
end

commits = [
  "build predicates on enumerize module",
  "extract Enumerize::Module class",
  "raise ArgumentError when enumerized attribute is already defined",
  "add Active Record scope only if scope option is passed",
  "remove unused local variable",
  "update CHANGELOG",
  "Commits service ZAPILEN",
  "typo fixed.",
  "Settings personal layout.",
  "corrected links",
  "Repo table controls alignment fixed.",
  "Fix Typos with hash assoc",
  "removed .tconsole",
  "continue to :rock:",
  "Replace colors for worse commits ratings.",
  "update hash for metrics",
  "Metrics calculationg implemented"
]

30.times do |t|
  data = {
    "author" => {
      "name" => 'Author',
      "email" => 'test@test.com'
    },
    "message" => commits.sample,
    "repository_id" => repository.id
  }

  CommitsService.add data
end
