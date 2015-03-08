module Admin
  class CategoriesController < ApplicationController
    def index
      render text: page_title
    end
  end
end

class SiteController < ApplicationController
  def index
    render text: page_title
  end

  def about
    page_title[:scope] = 'custom_scope.title'
    render text: page_title
  end
end

class CategoriesController < ApplicationController
  def show
    page_title[:name] = "CATEGORY"
    render text: page_title
  end
end
