require 'rails_helper'

describe CalendarsController do
  let!(:user) { FactoryGirl.create :user }
  let!(:attributes) { FactoryGirl.attributes_for :calendar }
  context 'index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  context 'create' do
    let!(:calendar) { FactoryGirl.create :calendar }
    before(:each) do
      WebMock.disable_net_connect!
      stub_request(:get, "https://www.googleapis.com/calendar/v3/calendars/nebulaforcego@gmail.com/events?key=#{ENV['GCAL_KEY']}")
      WebMock.allow_net_connect!

    end
    it "should get a 200 response from back google calendar" do
        expect(response.status).to eq(200)
    end
    xit "should create calendars in the database" do
    end
  end
end