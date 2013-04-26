set :rails_env, "production"
set :branch, 'staging'
set :user, 'commits_io_production'
set :keep_releases, 5
set :deploy_to, '/u/apps/commits.io'

set :db_adapter,     'postgres'
set :bundle_without, %w[development test]

role :web, "62.76.184.184"
role :app, "62.76.184.184"
role :db,  "62.76.184.184", primary: true
