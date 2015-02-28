require 'rails_helper'

describe "User", js: true do
  let(:user) { FactoryGirl.create :user }
    context "a logged in user on their profile page" do
      before(:each) do
        visit go_path
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_on "Log In"
        visit user_path(user.id)
      end
      it "can update their own password" do
        fill_in "old_password", with: user.password
        fill_in "user_password", with: "newPassword"
        fill_in "password_again", with: "newPassword"
        click_on "Update"
        expect(page).to have_content("Password updated")
      end
      it "is given an error message with bad credentials" do
        fill_in "old_password", with:
        "incorrect passyword"
        fill_in "user_password", with: "newPassword"
        fill_in "user_password", with: "newPassword"
        click_on "Update"
        expect(page).to have_content("Your new password was not saved.")
      end
    end
end
