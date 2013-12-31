module Archivist
  module Client
    module Constants

      DEFAULT_CONNECTION = Faraday.new(url: 'http://archive.org') do |faraday|
        faraday.use FaradayMiddleware::FollowRedirects
        faraday.request  :url_encoded             # form-encode POST params
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

    end
  end
end
