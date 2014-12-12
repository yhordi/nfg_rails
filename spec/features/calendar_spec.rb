require 'rails_helper'

describe "Create Button" do
  let!(:user) { FactoryGirl.create :user }
  context "a logged in user" do
    before(:each) do
        visit new_session_path
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_on "Log In"
        visit calendars_path
    end
    xit "should change the create button to the refresh button" do

    end
  end
end