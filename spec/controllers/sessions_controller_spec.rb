require 'rails_helper'

describe SessionsController  do
  let!(:user) { FactoryGirl.create :user }
  describe "sessions#create" do
    context 'with valid email and password' do
      it "creates a new user-session" do
        post :create, {:username => user.username, :password => user.password}
        expect(response.body).to include("redirect")
      end
    end
    context 'on no params' do
      it "does not create a new session" do
        expect(response.body).to eq("")
      end
    end
  end
end
