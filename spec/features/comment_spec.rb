require 'rails_helper'

describe 'Comment', js: true do
  let!(:article) { FactoryGirl.create :post }
  let!(:comment) { FactoryGirl.create :comment }
  let!(:user) { FactoryGirl.create :user }
  describe "a guest user" do
    before(:each) do
      visit post_path(article)
    end
    it "can see a comment" do
      expect(page).to have_content(comment.body)
    end
    it "can create a comment on a post" do
      body = "#fentylyfe"
      name = "Fenty Soetarman"
      fill_in 'comment_name', with: name
      fill_in 'comment_body', with: body
      click_on 'Create Comment'
      expect(page).to have_content(body)
    end
    it "renders an error on bad params" do
      name = "Fenty Soetarman"
      fill_in 'comment_name', with: name
      click_on 'Create Comment'
      expect(page).to have_content("Body can't be blank")
    end
  end
  describe "a logged in user" do
    before(:each) do
      visit go_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_on "Log In"
      visit post_path(article)
    end 
    it "can delete a comment" do
      click_on "Delete comment"
      page.driver.browser.switch_to.alert.accept
      expect(page).to_not have_content(comment.body)
    end
  end
end