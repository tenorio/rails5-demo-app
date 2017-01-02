require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rails5demo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Pretty console output with Hirb
    console do
      require 'hirb'

      Hirb.enable
    end

    # Create views using HAML
    config.generators do |g|
      g.template_engine :haml
    end
  end
end
