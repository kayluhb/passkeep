source 'http://rubygems.org'

gem 'rails', '3.2.1'

gem 'attr_encrypted'
gem 'aws-ses', :require => 'aws/ses'
gem 'capistrano'
gem 'delayed_job'
gem 'devise'
gem 'dragonfly', '~>0.9.8'
gem 'exception_notification'
gem 'jquery-rails'
gem 'pg'
gem 'rack'
gem 'rack-cache', :require => 'rack/cache'
gem 'settingslogic'
gem 'sunspot'
gem 'will_paginate'
gem 'uuidtools'

group :development do
  gem 'annotate'
  gem 'execjs'
  gem 'rails_best_practices'
  gem 'railroady'
  gem 'rspec-rails'
  gem 'sunspot_solr' # A standalone solr server for development
  gem 'therubyracer'
end

group :production do
  gem 'therubyracer'
end

group :test do
  gem 'cucumber-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'rspec-rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
