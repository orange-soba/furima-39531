require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログアウト状態の時はトップページのヘッダーに「新規登録」「ログイン」ボタンが表示される' do
    sign_in_basic(root_path) # Basic認証を通過してトップページに遷移
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
    log_in(@user) # Basic認証を通過してトップページに遷移した後、ログインしてトップページに遷移
    expect(page).to have_content(@user.nickname)
    expect(page).to have_content("ログアウト")
  end
  it 'トップページの「ログアウト」ボタンをクリックするとログアウトする' do
    log_in(@user)
    expect(page).to have_content("ログアウト")
    click_on "ログアウト"
    sleep 1
    expect(page).to have_content("ログイン") # 一番上のテストよりログアウト状態の確認
  end
end
