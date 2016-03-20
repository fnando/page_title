module PageTitle
  module Helpers
    private

    def page_title
      @page_title ||= PageTitle::Base.new(self)
    end
  end
end
