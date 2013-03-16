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
