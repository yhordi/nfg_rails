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
    xit 'renders the show page' do
    end
  end
  describe 'PUT #update' do
    let!(:title) { "A treatise on Malomars." }
    xit 'updates a field on a blog post' do
    end
  end
  describe 'POST #create' do
    xit 'creates a new blog post' do
    end
  end
  describe 'DELETE #destroy' do
    xit 'decrements blog posts by one' do
    end
  end
end
