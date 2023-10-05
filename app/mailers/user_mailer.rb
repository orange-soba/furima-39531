class UserMailer < ApplicationMailer
  default from: email_address_with_name(ENV['GOOGLE_EMAIL'], 'Furima-39531')

  def test_mail
    @user = params[:user]
    mail(
      to: email_address_with_name(@user.email, @user.nickname),
      subject: 'testです'
    )
  end
end
