require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dungie
  class Application < Rails::Application
    Irwi.config.formatter = Irwi::Formatters::SimpleHtml.new
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('lib/notifier')
  end
end
