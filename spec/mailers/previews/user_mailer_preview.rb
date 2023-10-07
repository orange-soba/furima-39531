# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def communicate_mail
    item = Item.find(10)
    user = item.user
    message = Faker::Lorem.sentence
    UserMailer.with(user: user, item: item, message: message).communicate_mail
  end

  def order_mail_buyer
    item = Item.find(10)
    user = item.order.user
    UserMailer.with(user: user, item: item).order_mail_buyer
  end

  def order_mail_seller
    item = Item.find(10)
    user = item.order.user
    UserMailer.with(user: user, item: item).order_mail_seller
  end

  def welcome_mail
    user = User.first
    UserMailer.with(nickname: user.nickname, email: user.email).welcome_mail
  end
end
