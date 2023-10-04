require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'messageの投稿' do
    context 'messageの投稿ができる場合' do
      it '全ての情報が正しければ投稿できる' do
        expect(@message).to be_valid
      end
    end
    context 'messageの投稿ができない場合' do
      it 'messageが空だと投稿できない' do
        @message.message = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Message can't be blank")
      end
      it 'roomと紐づいていないと投稿できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
      it 'userと紐づいていないと投稿できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end
  end
end
