require_relative '../spec_helper'

describe Archivist::Representation::Document do
  let(:json) { File.read(fixture('document.json')) }
  let(:doc) { Archivist::Model::Document.new }
  let(:rep) { Archivist::Representation::Document.new(doc).from_json(json) }

  it "parses" do
    rep
  end

  it "has properties" do
    rep.title.should == "Document"
    rep.language.should == "eng"
    rep.date.should == Date.new(1501, 1, 1)
  end
end
