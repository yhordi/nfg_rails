class MailController < ApplicationController


  def new
    # @mailer = ContactUsMailer.new
  end

  def send_mail
    mailer.contact
  end

end