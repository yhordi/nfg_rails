require 'rails_helper'

describe 'Contact', js: true do
  let!(:contact) { FactoryGirl.attributes_for :contact }
  before(:each) do
    visit contact_us_path
  end
  context "on good params" do
    it "should display a success message" do
      fill_in 'contact_name', with: contact[:name]
      fill_in 'contact_email', with: contact[:email]
      fill_in "contact_message", with: contact[:message]
      within('form') do
        click_on 'send message'
      end
      expect(page).to have_content("Your message has been sent!")
    end
  end
  context "on bad params" do
    it "should display an error on bad params" do
      fill_in 'contact_name', with: contact[:name]
      fill_in "contact_message", with: contact[:message]
      within('form') do
        click_on 'send message'
      end
      expect(page).to have_content("Email can't be blank")
    end
  end
end