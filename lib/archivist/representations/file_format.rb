require 'archivist/models'
require 'representable'
require 'representable/xml'

module Archivist
  module Representation
    class FileFormat < Representable::Decorator
      include Representable::XML

      property :name, attribute: true
      property :source, attribute: true

      property :format
      property :mtime
      property :size
      property :md5
      property :crc32
      property :sha1
    end
  end
end
