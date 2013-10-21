require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
require "page_title"

module Dummy
  class Application < Rails::Application
  end
end

