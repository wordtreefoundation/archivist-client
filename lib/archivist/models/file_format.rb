require 'virtus'

module Archivist
  module Model
    class FileFormat
      include Virtus.model

      attribute :name
      attribute :source
      attribute :format
      attribute :mtime
      attribute :size
      attribute :md5
      attribute :crc32
      attribute :sha1
    end
  end
end