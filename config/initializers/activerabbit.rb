ActiveRabbit::Client.configure do |config|
   config.api_key = "bf11b75344a84223b3e2a6ea9905a709aa6c821dd7d5af1dfbedabf340642b47"

  # Enable monitoring features
  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  # Optional: enable deployment tracking
  config.revision = ENV["APP_REVISION"] || `git rev-parse HEAD`.chomp
  config.disable_console_logs = false
  config.api_url = "https://app.activerabbit.ai"

  # Optional: 404 handling (true = ignore 404s, false = report them)
  config.ignore_404 = true
end
