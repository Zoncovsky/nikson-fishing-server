# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://d7cd0b1b6c5a4388ebb3a8985ff84200@o4510822251888640.ingest.de.sentry.io/4510822253264976'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  config.send_default_pii = true
  config.traces_sample_rate = 1.0
end
