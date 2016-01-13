require 'rails_helper'

RSpec.describe ApiResponse, :type => :model do
  describe 'validations' do
    it { should validate_uniqueness_of :body }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :body }
    it { should validate_presence_of :name }
  end
  describe 'custom methods' do
    let(:response_double) { double("response", body: youtube, headers: youtube_headers) }
    before(:each) do
      allow(RestClient).to receive(:get).and_return(response_double.body)
      RestClient.stub_chain(:get, :headers).and_return(response_double.headers)
    end
    describe '#get_youtube_channel' do
      it 'stores youtube channel info in the database on success' do
        expect(ApiResponse.get_youtube_channel).to eq(response_double.body)
      end
      xit 'responds with a non ok status code on failure' do
      end
    end
    describe '#youtube_content_length' do
      it 'responds with a content length on success' do
        expect(ApiResponse.youtube_content_length(ApiResponse.get_youtube_channel)).to eq(response_double.headers[:content_length].to_i)
      end
      xit 'responds with a non ok status code on failure' do
      end
    end
  end
end
