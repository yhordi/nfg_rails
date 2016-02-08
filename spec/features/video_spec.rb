require 'rails_helper'

describe 'Video with empty database', js: true do
  let!(:user) { FactoryGirl.create(:user) }
  context 'with a logged in user' do
    before(:each) do
      page.set_rack_session(user_id: user.id, username: user.username, id: user.id)
        visit videos_path
    end
    it "should display a create button to the user" do
      expect(page).to have_button("Seed Videos")
    end
  end
end
describe 'Video with videos in the database', js: true do
  let!(:user) { FactoryGirl.create :user }
  let!(:video) { FactoryGirl.create :video }
  let(:attributes) { FactoryGirl.attributes_for :video }
  context 'A logged in user' do
    before(:each) do
      page.set_rack_session(user_id: user.id, username: user.username, id: user.id)
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
