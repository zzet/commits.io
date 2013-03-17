#uri = URI.parse("redis://localhost:6379/")
uri = URI.parse("redis://192.168.3.14:6379/")
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
