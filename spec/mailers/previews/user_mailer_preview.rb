# Preview all emails at http://localhost:3000/rails/mailers/
class UserMailerPreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/test_mailer/test_mailにアクセス
  def communicate_mail
    item = Item.find(10)
    user = item.user
    message = Faker::Lorem.sentence
    UserMailer.with(user: user, item: item, message: message).communicate_mail
  end
end
