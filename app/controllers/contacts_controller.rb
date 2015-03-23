class ContactsController < ApplicationController


  def new
    @mailer = Contact.new
  end

  def send_mail
    mailer.contact
  end

end