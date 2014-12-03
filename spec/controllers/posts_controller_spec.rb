require 'rails_helper'

describe PostsController  do
    let!(:article) { FactoryGirl.create :post }
    let!(:user) { FactoryGirl.create :user}
    let!(:attributes) { FactoryGirl.attributes_for :post }
  describe 'GET #index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #show' do
    it 'renders the show page' do
      get :show, id: article.id
      expect(response).to render_template(:show)
    end
  end
  describe 'PUT #update' do
    let!(:title) { "A treatise on Malomars." }
    it 'updates a field on a blog post' do
      put :update, id: article.id, post: { title: title, body: article.body }
      expect(article.reload.title).to eq(article.title)
    end
  end
  describe 'POST #create' do
    it 'creates a new blog post' do
      @request.session[:username] = "captain wonderful"
      expect{
        post :create, :post => attributes
      }.to change{ Post.count }.by(1)
    end
  end
  describe 'DELETE #destroy' do
    it 'decrements blog posts by one' do
      expect {
        delete :destroy, id: article.id
      }.to change{ Post.count }.by(-1)
    end
  end
end
