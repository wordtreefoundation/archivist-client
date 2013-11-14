require 'archivist/models'
require 'representable'
require 'representable/json'

require_relative 'header'
require_relative 'body'

module Archivist
  module Representation
    class QueryResponse < Representable::Decorator
      include Representable::JSON

      property :header, as: "responseHeader",
               class: Model::Header,
               decorator: Header
      property :body, as: "response",
               class: Model::Body,
               decorator: Body
    end
  end
end
