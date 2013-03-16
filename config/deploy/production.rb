set :user, 'commits_io_production'
set :rails_env, 'production'

role :db,  "62.76.186.131", primary: true
role :app, "62.76.186.131"
role :web, "62.76.186.131"

set :branch, "master"
set :deploy_to, "/u/apps/commits.io"
