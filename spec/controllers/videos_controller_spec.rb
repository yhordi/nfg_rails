require 'rails_helper'
include JSON
describe VideosController do
  let!(:user) { FactoryGirl.create :user }
  let(:attributes) { FactoryGirl.attributes_for :video }
  context 'index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe 'create' do
    let!(:video) { FactoryGirl.create :video }
    before(:each) do
      response_double = double("response", body: youtube_json, headers: youtube_headers)
      allow(RestClient).to receive(:get).and_return(response_double)
    end
    it "responds with a status of 302" do
      post :create
      expect(response.status).to eq(302)
    end
    context 'when the database has no youtube responses' do
      it "creates video links in the database" do

        video = parse(youtube)["items"][0]["videoId"]
        expect(Video).to receive(:new).with({:link => "http://youtube.com/embed/#{video}"}).and_call_original
        post :create
      end
      xit 'creates a new ApiResponse in the database' do
      end
    end
    context 'when the database has a youtube response' do
      xit 'updates the old ApiResponse with a new body'
    end
  end
end
