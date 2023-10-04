require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @favorite = FactoryBot.build(:favorite)
    @favorite.user = user
    @favorite.item = item
  end

  describe '商品のお気に入り' do
    context 'お気に入りできる' do
      it '全ての情報が正しければお気に入りできる' do
        expect(@favorite).to be_valid
      end
    end
    context 'お気に入りできない' do
      it 'userと紐づいていないとお気に入りできない' do
        @favorite.user = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("User must exist")
      end
      it 'itemと紐づいていないとお気に入りできない' do
        @favorite.item = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("Item must exist")
      end
      it 'すでにお気に入り済みのitemはお気に入りできない' do
        @favorite.save
        another_favorite = FactoryBot.build(:favorite)
        another_favorite.user = @favorite.user
        another_favorite.item = @favorite.item
        another_favorite.valid?
        expect(another_favorite.errors.full_messages).to include("Item has already been taken")
      end
    end
  end
end
