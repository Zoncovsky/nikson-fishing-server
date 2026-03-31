# if Rails.env.development?
#   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# end
ActiveRabbit::Client.configure do |config|
   config.api_key = '640b14abc5c1f2e5f419d939b60e9bd6c265d8feaf78ff1f3a5c7608c6bf09a1'

  config.enable_performance_monitoring = true
  config.enable_n_plus_one_detection   = true
  config.enable_pii_scrubbing          = true

  config.revision = ENV['APP_REVISION'] || `git rev-parse HEAD`.chomp
  config.disable_console_logs = false
  # config.api_url = 'http://localhost:3003'
  config.api_url = 'https://84eb-176-120-110-210.ngrok-free.app'

  config.ignore_404 = true
end
