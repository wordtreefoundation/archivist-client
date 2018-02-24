# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'archivist/client/version'

Gem::Specification.new do |gem|
  gem.name = "archivist-client"
  gem.summary = "archivist-client is an archive.org client library"
  gem.description = "archivist-client queries archive.org for book data and downloads some things."
  gem.homepage = "http://github.com/wordtreefoundation/archivist-client"
  gem.authors = ['Duane Johnson','Peter Boling']
  gem.email = ['duane.johnson@gmail.com', 'peter.boling@gmail.com']
  gem.licenses = ["MIT"]

  gem.files = %w[archivist-client.gemspec README.md]
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("spec/**/*")

  gem.test_files = Dir.glob("spec/**/*")
  gem.require_paths = ["lib"]
  gem.version = Archivist::Client::VERSION
  gem.required_ruby_version = '>=2.4.0'

  gem.add_development_dependency "rake"
  gem.add_development_dependency "bundler", ">= 1.0.0"
  gem.add_development_dependency "rspec", "~> 3.7"
  gem.add_development_dependency "webmock", "~> 3.3"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "roodi", ">= 2.1.0"
  gem.add_development_dependency "gem-release", ">= 0.7.1"
  gem.add_development_dependency "coveralls"
  gem.add_development_dependency "rdoc", ">= 3.12"
  gem.add_development_dependency "pry"

  gem.add_dependency "virtus", "~> 1.0.0"
  gem.add_dependency "representable"
  gem.add_dependency "faraday"
  gem.add_dependency "faraday_middleware"
  gem.add_dependency "multi_json"
  gem.add_dependency "nokogiri"

end
