class ContactsController < ApplicationController


  def new
    @mailer = Contact.new
  end

  def send_mail
    mailer.contact
  end

  def create
    @mailer = Contact.new(contact_params)
    @mailer.deliver
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end