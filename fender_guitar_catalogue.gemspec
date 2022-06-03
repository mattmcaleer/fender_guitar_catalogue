# frozen_string_literal: true

require_relative "lib/fender_guitar_catalogue/version"

Gem::Specification.new do |spec|
  spec.name = "fender_guitar_catalogue"
  spec.version = FenderGuitarCatalogue::VERSION
  spec.authors = ["Matthew McAleer"]
  spec.email = ["matthew_mcaleer@hotmail.com"]
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.files = [
        "lib/fender_guitar_catalogue/guitar.rb",
        "lib/fender_guitar_catalogue/scraper.rb",
        "lib/fender_guitar_catalogue/cli.rb",
        "config/environment.rb"
  ]
  spec.license = 'MIT'

  spec.summary = "Fender Guitar Catalogue"
  spec.description = "Provides information on all Fender electric, acoustic and bass guitars."
  spec.homepage = "https://rubygems.org/gems/fender_guitar_catalogue"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.executables << 'fender_guitar_catalogue'
  spec.require_paths = ["lib"]

  

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "nokogiri", "~> 2.2"
  spec.add_dependency "open-uri"
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
