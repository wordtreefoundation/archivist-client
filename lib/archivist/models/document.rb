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

      def initialize
        @conn = Faraday.new(url: "http://archive.org") do |faraday|
          faraday.use FaradayMiddleware::FollowRedirects
          faraday.request  :url_encoded             # form-encode POST params
          # faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end

      def format_index
        response = @conn.get(index_xml_path)
        Model::FormatIndex.new.tap do |idx|
          Representation::FormatIndex.new(idx).from_xml(response.body)
        end
      end

      def download(format=:text)
        # e.g. format_index.text_format
        file_format = format_index.send(:"#{format}_format")
        # e.g. /download/firstbooknapole00gruagoog/firstbooknapole00gruagoog_djvu.txt
        @conn.get(download_path(file_format.name)).
          body.force_encoding('UTF-8')
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
