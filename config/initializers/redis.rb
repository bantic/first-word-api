if ENV["REDISCLOUD_URL"]
  redis_conn = Redis.new(:url => ENV["REDISCLOUD_URL"])
else
  redis_conn = Redis.new
end

redis_ns = "first-word-redis-#{Rails.env}"
$redis = Redis::Namespace.new(redis_ns, :redis => redis_conn)

