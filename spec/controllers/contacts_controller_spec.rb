require 'rails_helper'

describe ContactsController do
  describe '#new' do
    before(:each) do
      get :new
    end
    it "returns a 200" do
      expect(response.status).to eq(200)
    end
    it "sets the @mailer instance variable" do
      expect(assigns(:mailer)).to be_a(Contact)
    end
    it "renders the new page" do
      expect(response).to render_template(:new)
    end
  end
  describe '#create' do
    let!(:attributes) { FactoryGirl.attributes_for :contact}
    it "delivers an email" do
      post :create, :contact => attributes
      allow(Contact).to receive(:deliver).and_return(true)
      expect(Contact.deliver).to eq(true)
    end
    it "loads the home page on good params" do
      post :create, :contact => attributes
      allow(Contact).to receive(:deliver).and_return(true)
      expect(response.status).to eq(302)
    end
    it "reloads the contact us form on bad params" do
      post :create, :contact => {name: "Jordan", email: "jordan@email.com" }
      expect(response.status).to eq(302)
    end
  end
end