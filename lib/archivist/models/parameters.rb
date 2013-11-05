require 'virtus'

module Archivist
  module Model
    class Parameters
      include Virtus.model

      attribute :rows, Integer
      attribute :format, String
      attribute :start, Integer
      attribute :q, String
      attribute :qin, String
      attribute :fl, String
      attribute :sort, String
    end
  end
end