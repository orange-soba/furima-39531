require 'rails_helper'

module LogIn
  def log_in(user)
    sign_in_basic(root_path)
    click_on 'ログイン'
    sleep 1
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on 'ログイン'
    sleep 1
  end
end