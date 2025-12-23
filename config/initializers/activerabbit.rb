ActiveRabbit::Client.configure do |config|
   config.api_key = "b5167fc00158aaf5bf1035a8d63ed616af0632ad6f1de57e3a4e31a99ade76f5"

  # Enable monitoring features
  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  # Optional: enable deployment tracking
  config.revision = ENV["APP_REVISION"] || `git rev-parse HEAD`.chomp
  config.disable_console_logs = false

  # Optional: 404 handling (true = ignore 404s, false = report them)
  config.ignore_404 = true
end
