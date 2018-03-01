require 'faraday'
require 'faraday_middleware'
require 'archivist/client/constants'
require 'archivist/client/filters'
require 'archivist/representations'

module Archivist
  module Client
    # This is the primary interface of the gem.
    # Example Usage:
    #   require 'archivist/client'
    #   # Create an Archivist client:
    #   client = Archivist::Client::Base.new
    #   # Search for the books you're interested in:
    #   books = client.search(:start_year => 1500, :end_year => 1510)
    #   # Download them:
    #   books.each do |book|
    #     puts book.download
    #   end
    class Base

      include Archivist::Client::Constants

      attr_reader :conn
      attr_accessor :filters # will be a Filters.new object

      # filter_opts can be provided here, or when search is called.
      # filters_opts are:
      #   :language   => if *any* search opts provided there.
      #   :start_year => search opts takes precedence when provided there.
      def initialize(opts = {}, filter_opts = {})
        @filters = Archivist::Client::Filters.new(filter_opts)
        @opts = {
          page: 1,
          rows: 50
        }.merge(opts)

        @conn = DEFAULT_CONNECTION
      end

      def search(opts = {})
        Model::QueryResponse.new.tap do |qr|
          response = @conn.get('/advancedsearch.php', params(opts))
          rep = Representation::QueryResponse.new(qr)
          begin
            rep.from_json(response.body)
          rescue => e
            $stderr.puts "Unable to parse as Archivist::Representation::QueryResponse:"
            $stderr.puts response.body
            raise e
          end
        end
      end

      private

      def query(opts)
        @filters.update(opts)
        @filters.to_query
      end

      def params(opts = {})
        {
          q: query(opts),
          fl: %w(identifier title creator date language mediattype),
          sort: ['date asc'],
          output: 'json'
        }.merge(@opts).merge(opts)
      end

    end
  end
end
