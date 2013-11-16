require 'archivist/models'
require 'representable'
require 'representable/json'

module Archivist
  module Representation
    class Parameters < Representable::Decorator
      include Representable::JSON

      property :rows
      property :format, as: "wt"
      property :start
      property :q
      property :qin
      property :fl
      property :sort
    end
  end
end
