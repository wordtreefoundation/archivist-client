require_relative 'spec_helper'

require 'archivist/client'
require 'archivist/downloader'

describe Archivist::Downloader do
  let(:document) { Archivist::Model::Document.new }
  let(:client) { Archivist::Client.new }
  let(:conn) { client.conn }
  let(:downloader) { Archivist::Downloader.new(conn, document) }

  before do
    document.identifier = "firstbooknapole00gruagoog"
  end

  it "downloads a book" do
    VCR.use_cassette('download') do
      book = downloader.download
      book[10021..10050].should == "pilots the vessel and weathers"
    end
  end
end