require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログアウト状態の時はトップページのヘッダーに「新規登録」「ログイン」ボタンが表示される' do
    sign_in_basic(root_path)
    expect(page).to have_content('新規登録')
    expect(page).to have_content('ログイン')
  end
  it 'トップページの「ログイン」ボタンをクリックするとログインページに遷移する' do
    sign_in_basic(root_path)
    click_on 'ログイン'
    sleep 1
    expect(current_path).to eq(new_user_session_path)
  end
  it 'トップページの「新規登録」ボタンをクリックすると新規登録ページに遷移する' do
    sign_in_basic(root_path)
    click_on "新規登録"
    sleep 1
    expect(current_path).to eq(new_user_registration_path)
  end
  it 'ログイン状態の時はトップページのヘッダーに「ユーザーのニックネーム」と「ログアウト」ボタンが表示される' do
    log_in(@user)
    binding.pry
  end
  it 'トップページの「ログアウト」ボタンをクリックするとログアウトする' do
  end
end
