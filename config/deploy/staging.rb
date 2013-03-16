set :rails_env, "production"
set :branch, 'new_legacy_staging'
set :user, 'commits.io'
set :keep_releases, 5
set :deploy_to, '/u/apps/commits.io'

set :db_adapter,     'postgres'
set :bundle_without, %w[development test]

role :web, "176.9.83.211"
role :app, "176.9.83.211"
role :db,  "176.9.83.211", primary: true
