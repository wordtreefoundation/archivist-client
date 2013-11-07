module Archivist
  class Downloader
    def initialize(conn, doc)
      @conn = conn
      @doc = doc
    end

    def format_index
      response = @conn.get(@doc.download_xml_path)
      Model::FormatIndex.new.tap do |idx|
        Representation::FormatIndex.new(idx).from_xml(response.body)
      end
    end

    def download(format=:text)
      # e.g. format_index.text_format
      file_format = format_index.send(:"#{format}_format")
      # e.g. /download/firstbooknapole00gruagoog/firstbooknapole00gruagoog_djvu.txt
      @conn.get(@doc.download_path(file_format.name)).
        body.force_encoding('UTF-8')
    end
  end
end