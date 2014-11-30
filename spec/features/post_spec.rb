require 'rails_helper'

describe "Post", js: true do
  let!(:user) { FactoryGirl.create :user }
  let!(:post) { FactoryGirl.create :post }

  before(:each) do
    visit new_session_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Log In"
  end
  it "creates a new post" do
    visit root_path
    click_on "New Blog Post"
    fill_in "Post Title", with: post.title
    fill_in "Post Body", with: post.body
    click_on "create"
    expect(page).to have_content(post.title)
  end
end