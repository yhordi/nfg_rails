require 'rails_helper'

describe PostsController  do
    let!(:post) { FactoryGirl.create :post }
    let(:attributes) { FactoryGirl.attributes_for :post }
  describe 'GET #index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #show' do
    it 'renders the show page' do
      get :show, id: post.id
      expect(response).to render_template(:show)
    end
  end
  describe 'PUT #update' do
    let(:title) { "A treatise on Malomars." }
    it 'updates a field on a blog post' do
      put :update, id: post.id, post: {title: title, body: post.body}
      expect(post.reload.title).to eq(post.title)
    end
  end
  describe 'POST #create' do
    xit 'creates a new blog post' do
      expect{
        post :create, post: :attributes
      }.to change(Post,:count).by(1)
    end
  end
  describe 'DELETE #destroy' do
    it 'decrements blog posts by one' do
      expect {
        delete :destroy, id: post.id
      }.to change { Post.count }.by(-1)
    end
  end
end
