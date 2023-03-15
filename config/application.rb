require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SecretWhisper
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.require_master_key = true
    ENV['RAILS_MASTER_KEY'] = '7HOwP1Rea4rxQMQAsvqe0RhB2JiNpifWUoPRhjc85Oialp7EhGysfSTvdLOVKb3bWJ1LgKjJZetkDJXDmVmKnL9XPUKrIRietN8qP/Oh+CbRw0pEmJgum5sfx4wGPPelWBEo2NKpBkZztytABBGHvG4BpVzENO5JO8lNEgp+mMJlAlxxmxAWJK46bqWA95ytxi2uh6lgMJqbdZt4/UHDogIFEE+4vynkL81Vk7Cp/WDI62KE6C7V981Drq3i+8FPGH+K9m8qjpPn60/hAnXyPpXT5J2fS1drajbcEMS8K/Wk6ndGPLMxZgWgt4lAR1/BODP0GyR5t2XP5QqQMrZKvUlMWaogoTFzXmb8ePZsVTQc9AWsX62FTRlqEFoE3OTfakIM80RbPeQMI3+llcwS9avboqJr+KB6YIE7--r6erTUCBHlejRCfF--pd/Go6Uc2HJZ/NZiiz+hHQ=='

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
