require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品を出品できる場合" do
      it "必要な情報が揃っていれば商品を出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品を出品できない場合" do
    end
  end
end
