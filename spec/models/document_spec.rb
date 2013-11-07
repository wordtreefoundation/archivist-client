require_relative '../spec_helper'

describe Archivist::Model::Document do
  let(:document) { Archivist::Model::Document.new }

  it "initializes" do
    document
  end

  it "has download_xml_path" do
    document.identifier = "xyz"
    document.download_xml_path.should == "/download/xyz/xyz_files.xml"
  end
end