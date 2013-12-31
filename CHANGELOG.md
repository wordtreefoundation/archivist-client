# Version 0.1.4 /* DEC.31.2013

* Turned on Travis CI by Peter Boling
* removed ruby-head, rbx-19mode and jruby-19mode from Travis by Peter Boling
* Undid the PrimaDonnaMethods in the Archivist::Client::Filters class by Peter Boling
  * See https://github.com/troessner/reek/issues/51
* Added Coveralls for code coverage by Peter Boling
* Fixed the rdoc rake task for Ruby 1.9.2, added rdoc to Gemfile by Peter Boling

# Version 0.1.3 /* DEC.31.2013

* Handle require 'archivist-client' as well as 'archivist/client' by Peter Boling
* Fixed many links in Readme by Peter Boling

# Version 0.1.2 /* DEC.31.2013

* Synchronized versions across git tags, rubygems, and the VERSION internal constant by Peter Boling
* Improved documentation by Peter Boling
* New Archivist::Client::Filters class to manage the filters being used in each query to Archive.org by Peter Boling
* More explicit internal dependencies (Faraday) by Peter Boling

# Version 0.1.1 /* DEC.30.2013

* /* (tagged and pushed to ruby gems as 0.1.0 due to gem-release 0.6.0 bug)
* Changed gem name from 'archivist' (already taken on RubyGems.org) to archivist-client by Peter Boling
* Everything namespaced as needed, all tests pass by Peter Boling
* Added CHANGELOG.md, LICENSE, Rakefile, reek, roodi, and much documentation in README.md by Peter Boling

# Version Pre 0.1.0 11.11.2013

Initial release (not released past github source) by Duane Johnson
