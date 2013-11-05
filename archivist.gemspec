# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'archivist/version'

Gem::Specification.new do |gem|
  gem.name = "archivist"
  gem.summary = "Archivist is an archive.org client library"
  gem.description = "Archivist queries archive.org for book data and downloads some things."
  gem.homepage = "http://github.com/canadaduane/archivist"
  gem.authors = ['Duane Johnson']
  gem.email = ['duane.johnson@gmail.com']

  gem.files = %w[archivist.gemspec README.md]
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("spec/**/*")

  gem.test_files = Dir.glob("spec/**/*")
  gem.require_paths = ["lib"]
  gem.version = Archivist::VERSION
  gem.required_ruby_version = '>= 1.9.0'

  gem.add_development_dependency "rake"
  gem.add_development_dependency "bundler", ">= 1.0.0"
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "debugger"
  gem.add_development_dependency "pry"

  gem.add_dependency "virtus", "~> 1.0.0"
  gem.add_dependency "representable"
  gem.add_dependency "faraday"
end