require_relative 'spec_helper'

describe Archivist::Representation::Response do
  let(:json) { File.read(fixture('query-response.json')) }
  let(:response) { Archivist::Model::Response.new }
  let(:representation) { Archivist::Representation::Response.new(response).from_json(json) }

  it "parses" do
    representation
  end

  it "has header" do
    representation.header.status.should == 0
  end

  it "has body" do
    representation.body.docs.size.should == 31
  end
end