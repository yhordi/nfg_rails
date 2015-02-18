require 'rails_helper'

describe "Calendar with empty database", js: true do
  let!(:user) { FactoryGirl.create :user }
  context "with a logged in user" do
    before(:each) do
        visit go_path
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_on "Log In"
        visit calendars_path
    end
    it "should display a notice to the user" do
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
        visit go_path
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_on "Log In"
        visit calendars_path
    end
    it "should display a calendar event" do
      expect(page).to have_content(calendar.summary)
    end
    it "should display a refresh button" do
      within("form#new_calendar") do
        expect(page).to have_button("Refresh")
      end
    end
  end
end
