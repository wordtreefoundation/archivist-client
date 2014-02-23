require 'virtus'

module Archivist
  module Model
    class FormatIndex
      include Virtus.model

      attribute :formats

      def find(key)
        return nil if formats.nil?
        formats.find{ |value| value.format == key }
      end
      alias_method :[], :find

      def text_format
        find("DjVuTXT")
      end
    end
  end
end
