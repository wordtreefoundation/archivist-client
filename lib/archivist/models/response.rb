require 'virtus'

require_relative 'header'
require_relative 'body'

module Archivist
  module Model
    class Response
      include Virtus.model

      attribute :header, Header
      attribute :body, Body
    end
  end
end