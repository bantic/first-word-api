if ENV["REDISCLOUD_URL"]
  Rails.logger.info "Connecting to redis at #{ENV['REDISCLOUD_URL']}" * 10
  redis_conn = Redis.new(:url => ENV["REDISCLOUD_URL"])
else
  redis_conn = Redis.new
end

ns = "first-word-redis-#{Rails.env}"

$redis = Redis::Namespace.new(ns: ns, redis: redis_conn);
