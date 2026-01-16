if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
ActiveRabbit::Client.configure do |config|
   config.api_key = '12ad3efe0068fed92c5a1314daea05f19b9c85aa695ee189d04b1845af923ca7'

  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  config.revision = ENV['APP_REVISION'] || `git rev-parse HEAD`.chomp
  config.disable_console_logs = false
  config.api_url = 'https://app.activerabbit.ai'
  # config.api_url = 'https://e5ec6a09701f.ngrok-free.app'

  config.ignore_404 = true
end
