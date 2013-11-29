require 'virtus'

require_relative 'header'
require_relative 'body'

module Archivist
  module Model
    class QueryResponse
      include Virtus.model

      attribute :header, Header
      attribute :body, Body

      def each(&block)
        body && body.docs.each(&block)
      end

      def empty?
        body && body.docs.empty?
      end
    end
  end
end