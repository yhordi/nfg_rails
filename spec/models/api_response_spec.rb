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
    describe '#create_response' do
      it 'creates an ApiResponse in the database on success' do
        expect{ApiResponse.create_response('youtube')}.to change{ApiResponse.count}.by(1)
      end
    end
    describe '#update_response' do
      let(:stored_youtube) { FactoryGirl.create :api_response}
      let(:update_double) { double(
        "response", body: {items: "jello"}.to_json, headers: {content_length: "234098"}) }
      it 'updates an existing ApiResponse in the database' do
        allow(RestClient).to receive(:get).and_return(update_double)
        ApiResponse.update_response(stored_youtube)
        expect(stored_youtube.content_length).to eq(update_double.headers[:content_length].to_i)
      end
    end
    describe '#create_or_update' do
      it 'calls #create_response when database is empty' do
        expect(ApiResponse).to receive(:create_response).with('youtube')
        ApiResponse.create_or_update('youtube')
      end
      context 'when the database has a matching response' do
        let!(:youtube) { FactoryGirl.create :api_response}
        it 'calls #update_response ' do
          expect(ApiResponse).to receive(:update_response).with(youtube)
          ApiResponse.create_or_update('youtube')
        end
      end
    end
  end
end
