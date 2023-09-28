class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(item_id: params[:item_id])
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)&.destroy
    redirect_back(fallback_location: request.referer)
  end
end
