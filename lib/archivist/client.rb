require 'faraday'
require 'faraday_middleware'
require 'archivist/representations'

module Archivist
  class Client
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
