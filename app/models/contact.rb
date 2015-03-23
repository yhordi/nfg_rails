class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, :captcha => true

  validates :message, :presence => true
  def headers
    {
      :subject => "Message from nebulaforcego.herokuapp.com",
      :to => "bandalism@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
