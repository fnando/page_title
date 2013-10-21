module PageTitle
  class Engine < Rails::Engine
    config.to_prepare do
      ApplicationController.send :include, Helpers
      ApplicationController.helper_method :page_title
    end
  end
end
