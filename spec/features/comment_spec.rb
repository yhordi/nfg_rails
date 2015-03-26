require 'rails_helper'

describe 'Comment', js: true do
  let!(:article) { FactoryGirl.create :post }
  let!(:comment) { FactoryGirl.create :comment }
  before(:each) do
    visit post_path(article)
  end
  context "a guest user on a post's page" do
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
end