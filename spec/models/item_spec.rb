require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe "商品出品機能" do
    context "商品を出品できる場合" do
    end
    context "商品を出品できない場合" do
    end
  end
end
