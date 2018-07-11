require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DungeonWiki
  class Application < Rails::Application
    Irwi.config.formatter = Irwi::Formatters::SimpleHtml.new
  end
end
