require 'archivist/models'
require 'representable'
require 'representable/json'

require_relative 'parameters'

module Archivist
  module Representation
    class Header < Representable::Decorator
      include Representable::JSON

      property :status
      property :qtime, as: "QTime"
      property :params,
               class: Model::Parameters,
               decorator: Parameters
    end
  end
end
