require 'archivist/models'
require 'representable'
require 'representable/json'

module Archivist
  module Representation
    class Document < Representable::Decorator
      include Representable::JSON

      property :identifier
      property :title
      property :date
      property :language
      property :creator
    end
  end
end
