# if Rails.env.development?
#   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# end
ActiveRabbit::Client.configure do |config|
   config.api_key = '0c12f1c352960b41db9981831f06629b08e8bd95aca4f65fefba238e808de4ae'

  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  config.revision = ENV['APP_REVISION'] || `git rev-parse HEAD`.chomp
  config.disable_console_logs = false
  # config.api_url = 'http://localhost:3003'
  config.api_url = 'https://26f5-176-120-110-68.ngrok-free.app'

  config.ignore_404 = true
end
