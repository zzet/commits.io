source 'https://rubygems.org'

gem 'rails'
gem 'pg'
gem 'unicorn'
gem 'jbuilder'
gem 'haml-rails'
gem 'simple_form'
gem 'validates'
gem 'configus'
gem 'bcrypt-ruby'
gem 'omniauth'
gem 'omniauth-github', :git => 'git://github.com/intridea/omniauth-github.git'
gem 'state_machine'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "less-rails"
  gem 'jquery-ui-rails'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer', '0.10.2', :platform => :ruby
  gem 'libv8', '~> 3.3.10'
  gem 'uglifier', '>= 1.0.3'
  gem "twitter-bootstrap-rails"
end

gem 'jquery-rails'

group :development do
  gem "better_errors"
  gem 'capi', '0.1.1'
  gem 'capistrano', '2.13.5'
  gem 'rvm-capistrano', '1.2.7'
  gem 'capistrano-ext'
end

group :production do
  gem 'newrelic_rpm'
end

gem 'factory_girl_rails'

group :test do
  gem 'ci_reporter'
  gem 'minitest'
  gem 'simplecov', :require => false
  gem 'factory_girl_sequences'
  gem 'turn', :require => false
  gem 'tconsole', :require => false
end
