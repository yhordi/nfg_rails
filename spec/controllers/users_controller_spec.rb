require 'rails_helper'

describe UsersController do
  let!(:user) { FactoryGirl.create :user }
  let!(:attrubutes) { FactoryGirl.attributes_for :user }
  before do
    session[:id] = 1
  end
  describe "#show" do
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
  describe "PUT #update" do
    let!(:pass) { "newPassword" }
    let!(:old_salt) { user.password_digest }
    it "updates a user's password with valid params" do
      put :update, id: user.id, old_password: user.password, user: { password: pass }, password_again: pass
      expect(user.reload.password_digest).to_not eq(old_salt)
    end
    xit "does not update a user's password if the original password is incorrect" do
    end
    xit "does not update a user's password it the new password fields do not match" do
    end
  end
end
