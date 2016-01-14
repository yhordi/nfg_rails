require 'rails_helper'
describe VideosController do
  let!(:user) { FactoryGirl.create :user }
  let(:attributes) { FactoryGirl.attributes_for :video }
  context 'index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe '#create' do
    let!(:video) { FactoryGirl.create :video }
    let(:response_double) { double("response", body: youtube, headers: youtube_headers) }
    before(:each) do
      allow(RestClient).to receive(:get).and_return(response_double.body)
      RestClient.stub_chain(:get, :headers).and_return(response_double.headers)
    end
    it "responds with a status of 302" do
      post :create
      expect(response.status).to eq(302)
    end
    context 'when the database has no youtube responses' do
      it "creates video links in the database" do
        post :create
        expect(Video.first).to_not be_nil
      end
      it 'creates a new ApiResponse in the database' do
        expect{post :create}.to change{ApiResponse.all.count}.by(1)
      end
    end
    context 'when the database has a youtube response with a different content length than the response from youtube' do
      let(:youtube) { FactoryGirl.create :api_response}
      it 'changes an attribute of an existing ApiResponse in the database' do
          post :create
          expect(youtube.reload.content_length).to eq(youtube.content_length)
      end
    end
  end
end