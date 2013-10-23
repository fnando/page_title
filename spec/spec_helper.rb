require "bundler/setup"
Bundler.setup

ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"
require "rspec/autorun"
require "support/helpers"
require "support/controllers"

require "page_title"
I18n.locale = :en

RSpec.configure do |config|
  config.extend SpecHelper::ClassMethods
end
