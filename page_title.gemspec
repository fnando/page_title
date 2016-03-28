require "./lib/page_title/version"

Gem::Specification.new do |spec|
  spec.name          = "page_title"
  spec.version       = PageTitle::VERSION
  spec.authors       = ["Nando Vieira"]
  spec.email         = ["fnando.vieira@gmail.com"]
  spec.description   = "Set the page title on Rails apps"
  spec.summary       = spec.description
  spec.homepage      = "http://github.com/fnando/page_title"
  spec.license       = "MIT"

  spec.post_install_message = [
    "================================================",
    "WARNING: page_title was superseded by page_meta.",
    "         https://github.com/fnando/page_meta.",
    "================================================"
  ]

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
end
