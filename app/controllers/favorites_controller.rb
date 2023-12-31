class FavoritesController < ApplicationController
  before_action :set_item

  def create
    favorite = current_user.favorites.create(item_id: params[:item_id])
    respond_to do |format|
      format.html { redirect_to @item, notice: 'お気に入りに追加しました' }
      format.json { render json: @item, status: :created, location: @item }
    end
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)&.destroy
    respond_to do |format|
      format.html { redirect_to @item, notice: 'お気に入り登録を解除しました' }
      format.json { render json: @item, status: :destroyed, location: @item }
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
