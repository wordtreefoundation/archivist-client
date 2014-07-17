module Archivist
  module Client
    # Filters class manages the available filters that are configured to work with Archive.org
    # The public API is very simple, and is used to create Archive.org query strings:
    #   filters = Filters.new(options)
    #   query = filters.to_query
    class Filters

      # When Filters Provided are impossible try to Fail well.
      class FilterException < StandardError; end

      STANDARD_OPTIONS = [
        :filters,
        :language,
        :start_year, :end_year,
        :identifier
      ]
      DEFAULT_FILTERS = [
        'mediatype:texts',
        '-mediatype:collection'
      ]

      attr_accessor :options,
                    :filters,
                    :language,
                    :start_year, :end_year

      def initialize(opts)
        @options = {}
        self.update(opts)
      end

      def update(opts)
        self.prune_options(opts)
        self.set_language
        self.set_years
        self.set_identifier
        self.set_filters
      end

      # May result in a URI with filters looking like:
      #   http://archive.org/advancedsearch.php?fl%5B0%5D=identifier&fl%5B1%5D=title&fl%5B2%5D=creator&fl%5B3%5D=date&fl%5B4%5D=language&fl%5B5%5D=mediattype&output=json&page=1&q=mediatype:texts%20AND%20-mediatype:collection%20AND%20(language:eng%20OR%20language:English)%20AND%20date:%5B1500-01-01%20TO%201550-12-31%5D&rows=50&sort%5B0%5D=date%20asc
      alias :to_query :to_s
      def to_query
        self.finalize_filters
        @filters.join(' AND ')
      end

      protected

      def prune_options(opts)
        # Save the options we need to build the filter
        @options.merge!(opts)
        # Remove the options used from the passed in options, so they don't get converted into parameters
        STANDARD_OPTIONS.each do |opt|
          opts.delete(opt)
        end
      end

      # Only overwrite if update options has language key
      def set_language
        @language = @options[:language] if @options.has_key?(:language)
      end

      def set_years
        start = @options[:start_year]
        finish = @options[:end_year]
        @start_year = "#{start}-01-01" if start
        @end_year = "#{finish}-12-31" if finish
        self.validate_years
      end

      def set_identifier
        @identifier = @options[:identifier] if @options.has_key?(:identifier)
      end

      # If one is provided, they must *both* be provided
      def validate_years
        unless @start_year && @end_year
          raise FilterException, ":start_year and :end_year must always be provided together, but only :start_year provided as #{@start_year}." if @start_year
          raise FilterException, ":start_year and :end_year must always be provided together, but only :end_year provided as #{@end_year}." if @end_year
        end
        return true
      end

      def set_filters
        @filters = Array(@options[:filters]) # If opts[:filters] is nil => self.array is []
        @filters |= DEFAULT_FILTERS
      end

      def add_language_filter
        @filters << if @language
                          "language:#{@language}"
                        else
                          '(language:eng OR language:English)'
                        end
      end

      def add_date_filter
        if @start_year or @end_year
          start_year = @start_year || "1400-01-01"
          end_year = @end_year || "2100-12-31"
          @filters << "date:[#{start_year} TO #{end_year}]"
        end
      end

      def add_identifier
        @filters << "identifier:#{@identifier}" if @identifier
      end

      def finalize_filters
        add_language_filter
        add_date_filter
        add_identifier
        self
      end
    end
  end
end
