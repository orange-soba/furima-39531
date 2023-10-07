class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super

    UserMailer.with(nickname: params[:user][:nickname], email: params[:user][:email]).welcome_mail.deliver_later
  end
end