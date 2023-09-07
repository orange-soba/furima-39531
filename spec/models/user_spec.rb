require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる場合' do
      it '必要な情報が揃っていれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'すでに登録されているemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'test.email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが含まれていないと登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'pa33'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英字のみの場合は登録できない' do
        @user.password = 'password'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字（6文字以上）での入力が必須です")
      end
      it 'passwordが数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字（6文字以上）での入力が必須です")
      end
      it 'passwordに半角英数字以外が含まれている場合は登録できない' do
        @user.password = 'pass11$'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字（6文字以上）での入力が必須です")
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation += 'wrong'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)の名字が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)の名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)の名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'Myouji'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は、全角（漢字・ひらがな・カタカナ）での入力が必須です")
      end
      it 'お名前(全角)の名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'Namae'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は、全角（漢字・ひらがな・カタカナ）での入力が必須です")
      end
      it 'お名前カナ(全角)の名字が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)の名前が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)の名字が全角（カタカナ）でないと登録できない' do
        @user.last_name_kana = 'myouji'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は、全角（カタカナ）での入力が必須です")
      end
      it 'お名前カナ(全角)の名前が全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は、全角（カタカナ）での入力が必須です")
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
