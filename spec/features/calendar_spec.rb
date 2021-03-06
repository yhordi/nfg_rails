require 'rails_helper'

describe "Calendar with empty database", js: true do
  let!(:user) { User.create(username: 'hi', password: 'password') }
  context "with a logged in user" do
    before(:each) do
      page.set_rack_session(user_id: user.id, username: user.username, id: user.id)
      visit calendars_path
    end
    it "should display a notice to the user" do
      sleep(1)
      expect(page).to have_content("Add or make changes to events through google calendar.")
    end
    it "should display a create button" do
      within("form#new_calendar") do
        expect(page).to have_button("Create")
      end
    end
  end
end
describe "Calendar with items in database", js: true do
  let!(:user) { FactoryGirl.create :user }
  let!(:calendar) { FactoryGirl.create :calendar }
  let(:attributes) { FactoryGirl.attributes_for :calendar }
  context "with a logged in user" do
    before(:each) do
      page.set_rack_session(user_id: user.id, username: user.username, id: user.id)
      visit calendars_path
    end
    it "should display a calendar event" do
      expect(page).to have_content(calendar.summary)
    end
    it "should display a refresh button" do
      within('form#new_calendar') do
        expect(page).to have_button("Refresh")
      end
    end
  end
end
