set :user, 'commitsio'
set :rails_env, 'production'

role :db,  "176.9.83.211", primary: true
role :app, "176.9.83.211"
role :web, "176.9.83.211"

set :branch, "master"
set :deploy_to, "/rest/u/apps/commitsio"
