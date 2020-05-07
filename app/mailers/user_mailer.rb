class UserMailer < ApplicationMailer
  default from: 'limpp.br@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://www.limpp.com.vc/login'
    mail(to: @user.email, subject: 'Bem vindx ao limpp!')
  end
end
