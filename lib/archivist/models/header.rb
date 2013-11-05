require 'virtus'

require_relative 'parameters'

module Archivist
  module Model
    class Header
      include Virtus.model

      attribute :status, Integer
      attribute :qtime, Integer
      attribute :params, Parameters
    end
  end
end