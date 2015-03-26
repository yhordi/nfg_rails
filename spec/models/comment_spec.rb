require 'rails_helper'

describe Comment do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :body }
    it { should validate_presence_of :post_id}
  end
  describe "associations" do
    let!(:article) {FactoryGirl.create :post}
    let!(:comment) {FactoryGirl.create :comment}
    it "returns an associated comment" do
      expect(article.comments.first).to eq(comment)
    end
    it "returns an associated post" do
      expect(Comment.first.post).to eq(article)
    end
  end
end