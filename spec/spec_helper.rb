require 'vcr'
require 'pry'

# For code coverage, must be required before all application / gem / library code.
require 'coveralls'
Coveralls.wear!

require 'archivist-client'

def fixture(filename)
  File.join(File.dirname(__FILE__), 'fixtures', filename)
end

VCR.configure do |c|
  c.cassette_library_dir = fixture('vcr')
  c.hook_into :webmock
end
