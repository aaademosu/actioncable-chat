require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chatblog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_mailer.default_url_options = { :host => "example.com" }

    config.generators do |g|
      g.helper false
      g.assets false
      g.view_specs false
      g.stylesheets false
      g.javascripts false
      g.test_framework false # :test_unit, fixture: false, views: false, controllers: false
    end
  end
end
