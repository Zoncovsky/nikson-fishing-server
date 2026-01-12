if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
ActiveRabbit::Client.configure do |config|
   config.api_key = 'ae9c593fc25f86e6b66da40708a672c52dfb66953564643674053bae2ed02736'

  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  config.revision = ENV['APP_REVISION'] || `git rev-parse HEAD`.chomp
  config.disable_console_logs = false
  # config.api_url = "https://app.activerabbit.ai"
  config.api_url = 'http://localhost:3000'

  config.ignore_404 = true
end
