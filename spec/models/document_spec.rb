require_relative '../spec_helper'

describe Archivist::Model::Document do
  let(:document) { Archivist::Model::Document.new }

  it "initializes" do
    document
  end

  it "has download_xml_path" do
    document.identifier = "xyz"
    document.index_xml_path.should == "/download/xyz/xyz_files.xml"
  end

  context "downloading" do
    before do
      document.identifier = "firstbooknapole00gruagoog"
    end

    it "downloads a book" do
      VCR.use_cassette('download') do
        book = document.download
        book[10021..10050].should == "pilots the vessel and weathers"
      end
    end
  end
end
