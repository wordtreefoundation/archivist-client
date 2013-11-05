require 'virtus'

require_relative 'document'

module Archivist
  module Model
    class Body
      include Virtus.model

      attribute :num_found, Integer
      attribute :start, Integer
      attribute :docs, Array[Document]
    end
  end
end