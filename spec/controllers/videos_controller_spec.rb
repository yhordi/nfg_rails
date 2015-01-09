require 'rails_helper'
require_relative 'mock_json'

describe VideosController do
  let!(:user) { FactoryGirl.create :user }
  let(:attributes) { FactoryGirl.attributes_for :video }
  context 'index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  context 'create' do
    let!(:video) { FactoryGirl.create :video }
    it "should get a 200 response from back YouTube" do
        expect(response.status).to eq(200)
    end
    it "should create video links in the database" do
      response_double = double("response", body: $mock_youtube_json)
      allow(HTTParty).to receive(:get).and_return(response_double)
      video = $mock_youtube["items"][0]["snippet"]["resourceId"]["videoId"]
      expect(Video).to receive(:new).with({:link => "http://youtube.com/embed/#{video}"}).and_call_original
      post :create
    end
  end
end