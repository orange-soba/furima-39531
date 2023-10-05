class UserMailer < ApplicationMailer
  default from: email_address_with_name(ENV['GOOGLE_EMAIL'], 'Furima-39531')

  def communicate_mail
    @user = params[:user]
    @item = params[:item]
    @message = params[:message]
    @url = url_for(item_rooms_url(@item))
    mail(
      to: email_address_with_name(@user.email, @user.nickname),
      subject: 'コミュニケーションページに更新があります'
    )
  end
end
