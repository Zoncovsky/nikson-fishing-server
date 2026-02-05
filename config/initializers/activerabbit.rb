if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
ActiveRabbit::Client.configure do |config|
   config.api_key = '04748cd98e7ae7ec7df6aea5dd2372fc18c9c35decb09058dfed71c52793c649'

  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  config.revision = ENV['APP_REVISION'] || `git rev-parse HEAD`.chomp
  config.disable_console_logs = false
  # config.api_url = "https://app.activerabbit.ai"
  config.api_url = 'https://160ec4227c78.ngrok-free.app'

  config.ignore_404 = true
end
