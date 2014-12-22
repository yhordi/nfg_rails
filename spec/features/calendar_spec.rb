require 'rails_helper'

describe "Calendar", js: true do
  let!(:user) { FactoryGirl.create :user }
  context "with a logged in user" do
    before(:each) do
        visit new_session_path
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
    xit "should display a calendar event and a refresh button" do

    end
  end
end