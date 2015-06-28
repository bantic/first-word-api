require 'redis-namespace'
redis_ns = "first-word-redis-#{Rails.env}"

if ENV["REDISCLOUD_URL"]
  redis_conn = Redis.new(:url => ENV["REDISCLOUD_URL"])
  $redis = Redis::Namespace.new(ns: redis_ns, :redis => redis_conn)
else
  $redis = Redis::Namespace.new(ns: redis_ns)
end

