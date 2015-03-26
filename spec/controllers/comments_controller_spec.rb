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
  describe 'DELETE #destroy' do
    it "deletes a comment in the database" do
      expect {
      delete :destroy, post_id: article.id, id: comment.id
      }.to change{ Comment.count }.by(-1)
    end
    it "redirects to the post page" do
      delete :destroy, post_id: article.id, id: comment.id
      expect(response.status).to eq(302)
    end
  end
end