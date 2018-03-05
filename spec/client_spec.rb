require_relative 'spec_helper'

require 'archivist/client/base'

describe Archivist::Client::Base do
  let(:document) { Archivist::Model::Document.new }
  let(:client) { Archivist::Client::Base.new }

  context "searching" do
    it "returns a Response" do
      VCR.use_cassette('search') do
        response = client.search(start_year: 1500, end_year: 1550, page: 1)
        response.body.docs.size.should == 50
      end
    end
  end
end
