class RoomsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @room = @item.room
  end

  def edit
  end
end
