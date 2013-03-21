user = User.create(name: 'test', login: 'test', email: 'test@test.com')
committer = Committer.create(name: 'test', email: 'test@test.com', user_id: user.id)


