require 'vcr'
require 'archivist/models'
require 'archivist/representations/query_response'

def fixture(filename)
  File.join(File.dirname(__FILE__), 'fixtures', filename)
end

VCR.configure do |c|
  c.cassette_library_dir = fixture('vcr')
  c.hook_into :webmock
end
