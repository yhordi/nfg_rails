require 'rails_helper'

describe UsersController do
  describe "#show" do
    let!(:user) {FactoryGirl.create :user}
    before do
      session[:id] = 1
    end
    context "a valid user" do
      it "returns a 200" do
      get(:show, {id:  1})
        expect(response.status).to eq(200)
      end
    end
    context "an invalid user" do
      before do
        session[:id] = 2
      end
      it "redirects to the root path" do
      get(:show, {id:  1})
        expect(response.status).to eq(302)
      end
    end
  end
end
