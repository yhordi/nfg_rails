require 'rails_helper'

describe "User", js: true do
  let(:user) { FactoryGirl.create :user }
    context "a logged in user on their profile page" do
      before(:each) do
      page.set_rack_session(user_id: user.id, username: user.username, id: user.id)
        visit user_path(user.id)
      end
      it "can update their own password" do
        fill_in "old_password", with: user.password
        fill_in "user_password", with: "newPassword"
        fill_in "password_again", with: "newPassword"
        click_on "Update"
        expect(page).to have_content("Password updated")
      end
      context "is given an error message when" do
        it "bad credentials are entered" do
          fill_in "old_password", with:
          "incorrect passyword"
          fill_in "user_password", with: "newPassword"
          fill_in "password_again", with: "newPassword"
          click_on "Update"
          expect(page).to have_content("Your new password was not saved. You entered your original password incorrectly.")
        end
        it "passwords don't match" do
          fill_in "old_password", with:
          user.password
          fill_in "user_password", with: "Crabulae"
          fill_in "password_again", with: "Crabuloid"
          click_on "Update"
          expect(page).to have_content("Your new password was not saved. Your new passwords don't match.")
        end
      end
    end
end
