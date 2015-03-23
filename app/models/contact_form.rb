class ContactForm < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, :captcha => true

  def headers
    {
      :subject => "My Contact Form",
      :to => "nebulaforcego@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
