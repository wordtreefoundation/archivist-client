require 'faraday'
require 'faraday_middleware'
require 'virtus'
require 'date'

module Archivist
  module Model
    class Document
      UnsupportedFormat = Class.new(StandardError)

      include Virtus.model

      include Archivist::Client::Constants

      attr_reader :conn

      attribute :identifier, String
      attribute :title, String
      attribute :date, Date
      attribute :language, String
      attribute :creator, String

      def initialize
        @conn = DEFAULT_CONNECTION
      end

      def format_index
        response = @conn.get(index_xml_path)
        Model::FormatIndex.new.tap do |idx|
          rep = Representation::FormatIndex.new(idx)
          # binding.pry
          rep.from_xml(response.body)
        end
      end

      def download(format=:text)
        # e.g. format_index.text_format
        file_format = format_index.send(:"#{format}_format")
        if file_format.nil?
          raise UnsupportedFormat, "#{identifier} not available in format #{format}"
        else
          # e.g. /download/firstbooknapole00gruagoog/firstbooknapole00gruagoog_djvu.txt
          @conn.get(download_path(file_format.name)).
            body.force_encoding('UTF-8')
        end
      end

      def download_path(file)
        "/download/#{identifier}/#{file}"
      end

      def index_xml_path
        download_path("#{identifier}_files.xml")
      end
    end
  end
end
