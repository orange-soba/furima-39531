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

  def order_mail_buyer
    @user = params[:user]
    @item = params[:item]
    @shipping_days = @item.shipping_day.name
    @url = url_for(item_rooms_url(@item))
    mail(
      to: email_address_with_name(@user.email, @user.nickname),
      subject: 'コミュニケーションページへの案内です'
    )
  end

  def order_mail_seller
    @user = params[:user]
    @item = params[:item]
    @shipping_days = @item.shipping_day.name
    @url = url_for(item_rooms_url(@item))
    mail(
      to: email_address_with_name(@user.email, @user.nickname),
      subject: '出品した商品が購入されました'
    )
  end

  def welcome_mail
    @nickname = params[:nickname]
    email = params[:email]
    mail(
      to: email_address_with_name(email, @nickname),
      subject: 'Furima-39531へようこそ！'
    )
  end
end
