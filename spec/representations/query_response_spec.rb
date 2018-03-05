require_relative '../spec_helper'

describe Archivist::Representation::QueryResponse do
  let(:json) { File.read(fixture('query-response.json')) }
  let(:response) { Archivist::Model::QueryResponse.new }
  let(:rep) { Archivist::Representation::QueryResponse.new(response).from_json(json) }

  it "parses" do
    rep
  end

  it "has header" do
    rep.header.status.should == 0
  end

  it "has body" do
    rep.body.docs.size.should == 31
    rep.body.num_found == 31
  end

  it "has query time" do
    rep.header.qtime.should == 5
  end

  it "has docs" do
    rep.body.docs.first.language.should == ["eng"]
  end
end
