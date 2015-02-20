require 'rails_helper'

describe "User", js: true do
  let(:user) { FactoryGirl.create :user }
    context "a logged in user" do
      before(:each) do
        visit go_path
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_on "Log In"
      end
      it "can update their own password" do
        visit user_path(user.id)
        fill_in "old_password", with: user.password
        fill_in "user_password", with: "newPassword"
        click_on "Update"
        expect(page).to have_content("Password updated")
      end
    end
end
