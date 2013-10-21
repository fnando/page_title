require "spec_helper"

describe ApplicationController do
  context "simple controller name" do
    set_translations  "titles.base" => "%{title} - SITE",
                      "titles.site.index" => "TITLE"

    controller do
      def controller_name
        "site"
      end

      def index
        render text: page_title
      end
    end

    it do
      get :index
      expect(response.body).to eql("TITLE - SITE")
    end
  end

  context "namespaced controller name" do
    set_translations  "titles.base" => "%{title} - SITE",
                      "titles.admin.site.index" => "TITLE"

    controller do
      def controller_name
        "admin/site"
      end

      def index
        render text: page_title
      end
    end

    it do
      get :index
      expect(response.body).to eql("TITLE - SITE")
    end
  end

  context "using placeholders" do
    set_translations  "titles.base" => "%{title} - SITE",
                      "titles.site.index" => "%{name}"

    controller do
      def controller_name
        "site"
      end

      def index
        page_title[:name] = "NAME"
        render text: page_title
      end
    end

    it do
      get :index
      expect(response.body).to eql("NAME - SITE")
    end
  end

  context "rendering template" do
    render_views

    set_translations  "titles.base" => "%{title} - SITE",
                      "titles.site.index" => "TITLE"

    controller do
      def controller_name
        "site"
      end

      def index
      end
    end

    it do
      get :index
      expect(response.body).to match(%r[<title>TITLE - SITE</title>])
    end
  end
end
