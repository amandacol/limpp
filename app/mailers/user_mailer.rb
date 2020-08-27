class UserMailer < ApplicationMailer
  default from: 'limpp.com.vc@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://www.limpp.com.vc/login'
    mail(to: @user.email, subject: 'Bem vinde à limpp!')
  end
end
