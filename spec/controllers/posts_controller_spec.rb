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
  describe 'GET #new' do
    before(:each) do
      get :new
    end
    it "assigns the @post instance variable" do
      expect(assigns(:post)).to be_a_new(Post)
    end
    it "renders the new post template" do
      expect(response).to render_template(:new)
    end
  end
  describe 'POST #create' do
    before(:each) do
      @request.session[:username] = "captain wonderful"
    end
    it 'creates a new blog post' do
      expect{
        post :create, :post => attributes
      }.to change{ Post.count }.by(1)
    end
    it 'reloads the new post page on bad params' do
      post :create, :post => {title: "title"}
      expect(response).to redirect_to(new_post_path)
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
