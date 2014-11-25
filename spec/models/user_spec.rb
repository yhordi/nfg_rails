require 'rails_helper'

describe User do
  subject { FactoryGirl.create :user }
  context "validations" do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it "should require a username length of six or greater" do
      expect(:username.length).to be >= (6)
    end
  end
end