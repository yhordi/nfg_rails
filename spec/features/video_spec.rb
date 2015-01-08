require 'rails_helper'

describe 'Video with empty database', js: true do
  let!(:user) { FactoryGirl.create(:user) }
  context 'with a logged in user' do
    before(:each) do
        visit new_session_path
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_on "Log In"
        visit videos_path
    end
    it "should display a create button to the user" do
      expect(page).to have_button("Create")
    end
  end
end
describe 'Video with videos in the database', js: true do
  let!(:user) { FactoryGirl.create :user }
  let!(:video) { FactoryGirl.create :video }
  let(:attributes) { FactoryGirl.attributes_for :video }
  context 'A logged in user' do
    before(:each) do
      visit new_session_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_on "Log In"
      visit videos_path
    end
    it "should display a video" do
      expect(page).to have_selector("iframe")
    end
    it "should display a refresh button" do
      within("form#new_video") do
        expect(page).to have_button("Refresh")
      end
    end
  end
end