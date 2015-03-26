require 'rails_helper'

describe CommentsController do
  let!(:article) { FactoryGirl.create :post}
  let!(:comment) { FactoryGirl.create :comment}
  let(:attributes) {FactoryGirl.attributes_for :comment}
  describe 'POST #create' do
    it "creates a comment in the database" do
      expect {
    post :create, post_id: article.id, comment: attributes
      }.to change{ Comment.count }.by(1)
    end
  end
end