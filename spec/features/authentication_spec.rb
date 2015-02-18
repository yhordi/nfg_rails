require 'rails_helper'

describe "Authentication", js: true do
  let!(:user) { FactoryGirl.create :user }
  context "login" do
    it "redirects to the root path and shows the admin navbar with valid credentials" do
      visit go_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_on "Log In"
      expect(page).to have_content("#{user.username.titleize}")
    end
  end
end
