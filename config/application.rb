require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.filestack_api_secret = 'AmDGGpy17Tra981Hbnqjaz'
    # Keys for Slack App Integration
    config.slack_client_id = '10226271731.101768440085'
    config.slack_client_secret = '39c5a44c1b8b2a158572e083c2595153'
  end
end
