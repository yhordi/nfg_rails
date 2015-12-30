require 'rails_helper'

describe SessionsController  do
  let!(:user) { FactoryGirl.create :user }
  describe "#create" do
    context 'with valid email and password' do
      it "creates a new user-session" do
        post :create, {:username => user.username, :password => user.password}
        expect(response.body).to include("redirect")
      end
      it 'responds with a 302' do
        post :create, {:username => user.username, :password => user.password}
        expect(response.status).to eq(302)
      end
    end
    context 'on no params' do
      it "does not create a new session" do
        expect(response.body).to eq("")
      end
    end
  end
  describe '#destroy' do
    it 'sets the session id to nil' do
      session[:id] = user.id
      delete :destroy, id: user.id
      expect(session[:id]).to be_nil
    end
    it 'responds with a status of 302' do
      delete :destroy, id: user.id
      expect(response.status).to eq(302)
    end
  end
end
