require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)
module Project2
  class Application < Rails::Application
    config.load_defaults 8.0
    config.time_zone = "UTC"
  end
end
