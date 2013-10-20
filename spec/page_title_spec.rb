require "spec_helper"

describe PageTitle do
  subject(:page_title) { PageTitle::Base.new(controller) }

  context "simple controller name" do
    set_controller "site", "index"
    set_translations "titles.site.index" => "TITLE",
                     "titles.base" => "%{title}"

    it { expect(page_title.to_s).to eql("TITLE") }
  end

  context "namespace controller name" do
    set_controller "admin/site", "index"
    set_translations "titles.admin.site.index" => "TITLE",
                     "titles.base" => "%{title}"

    it { expect(page_title.to_s).to eql("TITLE") }
  end

  context "with placeholders" do
    set_controller "site", "index"
    set_translations "titles.site.index" => "%{sample}",
                     "titles.base" => "%{title}"

    it {
      page_title[:sample] = "TITLE"
      expect(page_title.to_s).to eql("TITLE")
    }
  end
end
