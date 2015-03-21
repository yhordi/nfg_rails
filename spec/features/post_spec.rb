require 'rails_helper'
include TinyMceFillIn

describe "Post", js: true do
  let!(:user) { FactoryGirl.create :user }
  let!(:post) { FactoryGirl.create :post }
  context "a logged in user" do
    before(:each) do
      visit go_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_on "Log In"
    end
    it "has an iframe" do
      visit root_path
      click_on "New Blog Post"
      expect(page.has_css?('iframe')).to be(true)
    end
    context "show page" do
      before(:each) do
        visit root_path
        click_on "#{post.title}"
      end
      it "has an iframe" do
        new_body = "this is the newest, fakest body."
        # fill_in ("Post Body"), with: new_body
        # click_on "Update"
        expect(page.has_css?('iframe')).to be(true)
      end
      it "Can delete a post." do
        click_on "Delete Post"
        page.driver.browser.switch_to.alert.accept
        expect(page).to_not have_content(post.title)
      end
    end
  end
  context "a guest user" do
    before(:each) do
      visit root_path
    end
    it "can see a blog post" do
      click_on post.title
      expect(page).to have_content(post.body)
    end
    it "can see all blog posts" do
      expect(page).to have_content(post.body)
    end
  end
end
