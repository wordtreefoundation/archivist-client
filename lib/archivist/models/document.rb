require 'virtus'
require 'date'

module Archivist
  module Model
    class Document
      include Virtus.model

      attribute :identifier, String
      attribute :title, String
      attribute :date, Date
      attribute :languages, Array[String]
      attribute :creators, Array[String]

      def download_xml_path
        "/download/#{identifier}/#{identifier}_files.xml"
      end
    end
  end
end