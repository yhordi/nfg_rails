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
      stub_request(:get, "https://www.googleapis.com/calendar/v3/calendars/nebulaforcego@gmail.com/events?key=#{ENV['GCAL_KEY']}").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
    end
    it "should get a 200 response from back google calendar" do
        expect(response.status).to eq(200)
    end
    it "should create calendars in the database" do
      expect{
        post :create, :calendar => attributes
        }.to change{ Calendar.count }.by(1)
    end
  end
end