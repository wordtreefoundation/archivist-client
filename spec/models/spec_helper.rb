$:.unshift(File.join(File.dirname(__FILE__), '..', '..'))

require 'archivist/models'

def fixture(filename)
  File.join(File.dirname(__FILE__), '..', 'fixtures', filename)
end