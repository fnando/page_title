require "spec_helper"

describe "Simple controller name" do
  describe SiteController do
    set_translations  "titles.base" => "%{title} - SITE",
                      "titles.site.index" => "TITLE"

    example do
      routes.draw { get :index, to: "site#index" }
      get :index

      expect(response.body).to eql("TITLE - SITE")
    end
  end
end

describe "Namespaced controller name" do
  set_translations  "titles.base" => "%{title} - SITE",
                    "titles.admin.categories.index" => "TITLE"

  describe Admin::CategoriesController do
    example do
      routes.draw { get :index, to: "admin/categories#index" }
      get :index

      expect(response.body).to eql("TITLE - SITE")
    end
  end
end

describe "Using custom scope" do
  set_translations "titles.base" => "%{title} - SITE",
                   "custom_scope.title" => "CUSTOM SCOPE"

  describe SiteController do
    example do
      routes.draw { get :about, to: "site#about" }
      get :about

      expect(response.body).to eql("CUSTOM SCOPE - SITE")
    end
  end
end

describe "Using placeholders" do
  set_translations  "titles.base" => "%{title} - SITE",
                    "titles.categories.show" => "%{name}"

  describe CategoriesController do
    example do
      routes.draw { get :show, to: "categories#show" }
      get :show

      expect(response.body).to eql("CATEGORY - SITE")
    end
  end
end

describe "Rendering template" do
  set_translations  "titles.base" => "%{title} - SITE",
                    "titles.site.contact" => "TITLE"

  describe SiteController do
    example do
      routes.draw { get :contact, to: "site#contact" }
      get :contact

      expect(response.body).to match(%r[<title>TITLE - SITE</title>])
    end
  end
end
