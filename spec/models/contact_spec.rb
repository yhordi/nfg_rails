require 'rails_helper'

describe Contact do
  it { should validate_presence_of :name }
  it { should validate_presence_of :message }
  it { should validate_presence_of :email}
  context "email address validations" do
    it "validates a valid email address" do
      mailer = Contact.new(name: "Jordan", email: "jordan@email.com", message: "I'm so great.")
      expect(mailer.valid?).to be(true)
    end
    it "does not validate an invalid email" do
      mailer = Contact.new(name: "Jordan", email: "jordanemailcom", message: "I'm so great.")
      expect(mailer.valid?).to be(false)
    end
  end
end