require_relative 'spec_helper'

require 'archivist/client'

describe Archivist::Client do
  let(:document) { Archivist::Model::Document.new }
  let(:client) { Archivist::Client.new }

  context "searching" do
    it "returns a Response" do
      VCR.use_cassette('search') do
        response = client.search(start_year: 1500, end_year: 1550, page: 1)
        response.body.docs.size.should == 31
      end
    end
  end
end
