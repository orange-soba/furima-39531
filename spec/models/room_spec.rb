require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'roomの作成・更新' do
    context 'roomの作成・更新のできる場合' do
      it '全ての情報が正しければroomの作成が可能' do
        expect(@room).to be_valid
      end
      it 'limitがcreated_atの3週間後までなら更新できる' do
        @room.limit += 1.week
        expect(@room).to be_valid
      end
    end
    context 'roomの作成・更新のできない' do
      it 'limitが空だと作成できない' do
        @room.limit = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Limit can't be blank")
      end
      it 'itemと紐づいていないと作成できない' do
        @room.item = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Item must exist")
      end
      it 'limitがcreated_atの3週間後より未来だと更新できない' do
        @room.limit += 2.week
        @room.valid?
        expect(@room.errors.full_messages).to include("Limit はコミュニケーションページの作成された日の3週間後を超えてはいけません")
      end
    end
  end
end
