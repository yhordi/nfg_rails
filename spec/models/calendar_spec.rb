require 'rails_helper'

describe Calendar do
  let!(:calendar) { FactoryGirl.create :calendar }
  let!(:attributes) { FactoryGirl.attributes_for :calendar }
  context "Validations" do
    it "should validate an event set in the future." do
      expect(calendar).to be_valid
    end
    it "should not validate an event in the past." do
      calendar.time = "2014-09-20 19:39:38 -0700"
    end
  end
end