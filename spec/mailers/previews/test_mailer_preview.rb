# Preview all emails at http://localhost:3000/rails/mailers/user
class TestMailerPreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/test_mailer/test_mailにアクセス
  def test_mail
    user = User.find(4)
    UserMailer.with(user: user).test_mail
  end
end
