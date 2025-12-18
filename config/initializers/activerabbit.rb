# ActiveRabbit::Client.configure do |config|
#   config.api_key = 'd1d1436596e96f782e19b5b305f6eeb0834e362d426f000dba83371e89ccb9bb'

#   # Enable monitoring features
#   config.enable_performance_monitoring = true
#   config.enable_n_plus_one_detection = true
#   config.enable_pii_scrubbing = true

#   config.api_url = 'http://localhost:3000'
#   # config.disable_console_logs = false

#   config.ignore_404 = false
#   # config.revision = ENV["APP_REVISION"] || `git rev-parse HEAD`.chomp
# end

ActiveRabbit::Client.configure do |config|
  config.api_key = '83db4c5f00a7b6449e38ceeef5da3670f43b6dfff864189fe40cfef275526beb'

  # Enable monitoring features
  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  # Optional: enable deployment tracking
  config.revision = ENV['APP_REVISION'] || `git rev-parse HEAD`.chomp

  # Optional: 404 handling (true = ignore 404s, false = report them)
  config.ignore_404 = true
end
