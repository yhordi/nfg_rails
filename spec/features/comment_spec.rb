require 'rails_helper'

describe 'Comment', js: true do
  let(:article) { FactoryGirl.create :post }
  let(:comment) { FactoryGirl.create :comment }
  before(:each) do
    visit post_path(article)
  end
  context "a guest user" do
    it "can create a comment on a post" do
      fill_in 'comment_name', with: comment.name
      fill_in 'comment_body', with: comment.body
      click_on 'Create Comment'
      expect(page).to have_content(comment.body)
    end
    it "renders an error on bad params" do
      fill_in 'comment_name', with: comment.name
      click_on 'Create Comment'
      expect(page).to have_content("Body can't be blank")
    end
  end
end