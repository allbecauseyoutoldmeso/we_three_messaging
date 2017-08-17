class MessageMailer < ApplicationMailer

  default from: 'wethreemessaging@gmail.com'

  def notification_email(user, message)
    @user = user
    @message = message
    mail(to: @user.email, subject: 'message from we three')
  end

end
