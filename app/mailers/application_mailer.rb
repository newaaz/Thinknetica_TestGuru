class ApplicationMailer < ActionMailer::Base
  default from: 'ilove-krim@mail.ru'
  layout 'mailer'

  def send_message(message)
    @message = message

    mail to: "newaz@mail.ru", subject: "TestGuru: new message"
  end
end
