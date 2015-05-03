source 'https://rubygems.org'
ruby "2.2.0"

gem 'dotenv-rails', :groups => [:development, :test]

gem 'rails', '4.2.1'
gem 'pg'
gem 'redis'
gem 'redis-namespace'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

gem 'puma'

# https://github.com/activeadmin/activeadmin
gem 'activeadmin', github: 'activeadmin'
gem 'devise' # Necessary for activeadmin

# https://github.com/norman/friendly_id
# Friendly slugs in urls
gem 'friendly_id', '~> 5.1.0'

# http://markevans.github.io/dragonfly/
gem 'dragonfly'
# https://github.com/markevans/dragonfly-s3_data_store
gem 'dragonfly-s3_data_store'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'foreman'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'spring'
end

group :test do
  gem 'fabrication'
  gem 'rspec-rails', '~> 3.0'
  gem 'fakeredis', :require => 'fakeredis/rspec'
  gem 'faker'
end
