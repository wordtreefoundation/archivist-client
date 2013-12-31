require 'faraday'
require 'faraday_middleware'
require 'archivist/representations'

# This is the primary interface of the gem.
# Example Usage:
#   require 'archive-client'
#   # Create an Archivist client:
#   client = Archivist::Client::Base.new
#   # Search for the books you're interested in:
#   books = client.search(:start_year => 1500, :end_year => 1510)
#   # Download them:
#   books.each do |book|
#     puts book.download
#   end
module Archivist
  module Client
    class Base
      attr_reader :conn

      def initialize(opts = {})
        @opts = {
          page: 1,
          rows: 50
        }.merge(opts)

        @conn = Faraday.new(url: 'http://archive.org') do |faraday|
          faraday.use FaradayMiddleware::FollowRedirects
          faraday.request  :url_encoded             # form-encode POST params
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end

      def query(opts)
        filters = [
          'mediatype:texts',
          '-mediatype:collection'
        ]

        filters.concat(opts.delete(:filters)) if opts[:filters]

        filters << if opts[:language]
          "language:#{opts.delete(:language)}"
        else
          '(language:eng OR language:English)'
        end

        if opts[:start_year] && opts[:end_year]
          start_year = "#{opts.delete(:start_year)}-01-01"
          end_year = "#{opts.delete(:end_year)}-12-31"
          filters << "date:[#{start_year} TO #{end_year}]"
        end

        filters.join(' AND ')
      end

      def params(opts = {})
        {
          q: query(opts),
          fl: %w(identifier title creator date language mediattype),
          sort: ['date asc'],
          output: 'json'
        }.merge(@opts).merge(opts)
      end

      def search(opts = {})
        Model::QueryResponse.new.tap do |qr|
          response = @conn.get('/advancedsearch.php', params(opts))
          Representation::QueryResponse.new(qr).from_json(response.body)
        end
      end
    end
  end
end
