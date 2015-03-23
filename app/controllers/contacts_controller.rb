class ContactsController < ApplicationController


  def new
    @mailer = Contact.new
  end

  def send_mail
    mailer.contact
  end

  def create
    mailer = Contact.new(contact_params)
    if mailer.valid?
      mailer.deliver
      redirect_to root_path,
      :flash => {:success => "Your message has been sent!"}
    else
      flash[:error] = mailer.errors.full_messages
      ap flash[:error]
      redirect_to new_contact_path
    end

  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end