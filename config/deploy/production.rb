set :user, 'commits_io_production'
set :rails_env, 'production'

role :db,  "commits.io", primary: true
role :app, "commits.io"
role :web, "commits.io"

set :branch, "master"
set :deploy_to, "/u/apps/commits.io"
