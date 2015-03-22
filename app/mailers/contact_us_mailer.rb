class ContactUsMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact(subject)
    mail(to: "nebulaforcego@gmail.com", subject: subject)
  end
end
