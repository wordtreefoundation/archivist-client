require_relative '../spec_helper'

describe Archivist::Representation::FormatIndex do
  let(:xml) { File.read(fixture('download_files.xml')) }
  let(:index) { Archivist::Model::FormatIndex.new }
  let(:rep) { Archivist::Representation::FormatIndex.new(index).from_xml(xml) }

  it "parses" do
    rep
  end

  context "represented" do
    before do
      rep
    end

    it "has properties" do
      index.formats.size.should == 12
      index.formats.first.format.should == "Metadata"
      index.formats.first.name.should == "firstbooknapole00gruagoog_meta.xml"
    end

    it "has a square bracket lookup" do
      index["Metadata"].name.should == "firstbooknapole00gruagoog_meta.xml"
      index["DjVuTXT"].name.should == "firstbooknapole00gruagoog_djvu.txt"
    end

    it "has a text_format" do
      index.text_format.name.should == "firstbooknapole00gruagoog_djvu.txt"
    end
  end
end
