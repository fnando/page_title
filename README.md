# page_title

[![Build Status](https://travis-ci.org/fnando/page_title.svg?branch=master)](https://travis-ci.org/fnando/page_title)

Set the page title on Rails apps.

## Installation

Add this line to your application's Gemfile:

    gem "page_title"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install page_title

## Usage

You can use this on your layout file to display the page title:

```erb
<%= page_title %>
```

To ignore the base translation, use `page_title.simple`.

```erb
<%= page_title.simple %>
```

The page title will be inferred from the controller and action names. For an action `SiteController#index` you'll the following translate scope:

```yaml
en:
  titles:
    base: "%{title} • MyCompany"
    site:
      index: "Welcome to our site"
```

The `titles.base` scope is required and will be used to set a general title information, like your company's name.

You can also set the page title for namespaced controllers. For an action `Admin::Site#index` you'll need the following translate scope:

```yaml
en:
  titles:
    base: "%{title} • MyCompany"
    admin:
      site:
        index: "Welcome to our site"
```

Sometimes you need to render some dynamic value. In this case, you can use the I18n placeholders.

```yaml
en:
  titles:
    base: "%{title} • MyCompany"
    workshops:
      show: "%{name}"
```

You can set dynamic values using the `PageSite::Base#[]=`.

```ruby
class WorkshopsController < ApplicationController
  def show
    @workshop = Workshop.find_by_permalink!(params[:permalink])
    page_title[:name] = @workshop.name
  end
end
```

You can also use a custom translation scope. Just set the `:scope` option.

```ruby
class PagesController < ApplicationController
  def show
    page_title[:scope] = "pages.titles.#{params[:page]}"
  end
end
```

If you're creating a controller that do not extend from `ApplicationController`, remember to use the lines below:

```ruby
class AdminController < ActionController::Base
  include PageTitle::Helpers
  helper_method :page_title
end
```

We detect the following action aliases:

* Action `create` points to `new`
* Action `update` points to `edit`
* Action `destroy` points to `remove`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
