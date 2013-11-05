$:.unshift(File.join(File.dirname(__FILE__), '..', '..'))

require 'archivist/models'
require 'archivist/representations/response'

def fixture(filename)
  File.join(File.dirname(__FILE__), '..', 'fixtures', filename)
end