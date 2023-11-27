require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'commentの投稿' do
    context 'commentの投稿ができる場合' do
      it '全ての情報が正しければ投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'commentの投稿ができない場合' do
      it 'commentが空だと投稿できない' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end
      it 'itemと紐づいていないと投稿できない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
      it 'userと紐づいていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
    end
  end
end
