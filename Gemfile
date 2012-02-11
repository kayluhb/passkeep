source 'http://rubygems.org'

gem 'rails', '3.2.1'

gem 'attr_encrypted'
gem 'aws-ses', :require => 'aws/ses'
gem 'capistrano'
gem 'delayed_job'
gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'dragonfly', '~>0.9.8'
gem 'exception_notification'
gem 'jquery-rails'
gem 'pg'
gem 'rack'
gem 'rack-cache', :require => 'rack/cache'
gem 'settingslogic'
gem 'sunspot', :git => 'https://github.com/sunspot/sunspot.git'
gem 'will_paginate'
gem 'uuidtools'

group :development do
  gem 'annotate', :git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
  gem 'execjs'
  gem 'rails_best_practices'
  gem 'rspec-rails'
  gem 'therubyracer'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'therubyracer'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
