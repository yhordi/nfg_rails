require 'rails_helper'
require_relative 'mock_json'

describe CalendarsController do
  let!(:user) { FactoryGirl.create :user }
  let(:attributes) { FactoryGirl.attributes_for :calendar }
  context 'index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  context 'create' do
    let!(:calendar) { FactoryGirl.create :calendar }
    it "should get a 200 response from back google calendar" do
        expect(response.status).to eq(200)
    end
    it "should create calendars in the database" do
      response_double = double("response", body: $mock_json)
      allow(HTTParty).to receive(:get).and_return(response_double)
      event = $mock_hash["items"][0]
      expect(Calendar).to receive(:new).with(summary: event["summary"], time: anything, description: event["description"], readable_time: anything, location: event["location"]).and_call_original
      post :create
    end
  end
end