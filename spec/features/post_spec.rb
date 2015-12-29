require 'rails_helper'
include TinyMceFillIn

describe "Blog", js: true do
  let!(:user) { FactoryGirl.create :user }
  let!(:post) { FactoryGirl.create :post }
  context "a logged in user" do
    before(:each) do
      page.set_rack_session(user_id: user.id, username: user.username, id: user.id)
      visit root_path
    end
    it "has an iframe" do
      visit root_path
      click_on "New Blog Post"
      expect(page.has_css?('iframe')).to be(true)
    end
    context "show page" do
      before(:each) do
        click_on "#{post.title}"
      end
      it "has an iframe" do
        new_body = "this is the newest, fakest body."
        expect(page.has_css?('iframe')).to be(true)
      end
      # it "Can delete a post." do
      #   click_on "Delete Post"
      #   page.accept_confirm { click_button "OK" }

      #   expect(page).to_not have_content(post.title)
      # end
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
