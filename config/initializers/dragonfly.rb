require 'dragonfly'
require 'dragonfly/s3_data_store'
require_relative 's3_env_variables'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "7a1f5d1b1ec509c628b6f2eb4aa91ca3ab39064a06b675a41f9bad74fd26d6f4"

  url_format "/media/:job/:name"

  puts "X"*100
  puts AWS_BUCKET_NAME.inspect
  puts AWS_ACCESS_KEY_ID.inspect
  puts AWS_SECRET_ACCESS_KEY.inspect
  puts "X"*100

  datastore :s3,
    bucket_name: AWS_BUCKET_NAME,
    access_key_id: AWS_ACCESS_KEY_ID,
    secret_access_key: AWS_SECRET_ACCESS_KEY
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
