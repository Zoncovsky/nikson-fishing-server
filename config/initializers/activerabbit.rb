# if Rails.env.development?
#   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# end
ActiveRabbit::Client.configure do |config|
   config.api_key = '5c72afd58d4e4222a210305378590f1e122732a524366c948215df53e8161510'

  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  config.revision = ENV['APP_REVISION'] || `git rev-parse HEAD`.chomp
  config.disable_console_logs = false
  # config.api_url = "https://app.activerabbit.ai"
  config.api_url = 'https://9ba8-176-120-110-68.ngrok-free.app'

  config.ignore_404 = true
end
