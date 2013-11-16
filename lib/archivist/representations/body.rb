require 'archivist/models'
require 'representable'
require 'representable/json'

require_relative 'document'

module Archivist
  module Representation
    class Body < Representable::Decorator
      include Representable::JSON

      property :num_found, as: "numFound"
      property :start
      collection :docs,
                 class: Model::Document,
                 decorator: Document
    end
  end
end
