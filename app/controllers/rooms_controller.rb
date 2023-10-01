class RoomsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @room = @item.room
  end

  def edit
    @item = Item.find(params[:item_id])
    @room = @item.room
  end

  def update
    @room = Room.find(params[:id])
    @item = Item.find(room_params[:item_id])
    if @room.update(room_params)
      redirect_to item_rooms_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:limit).merge(item_id: params[:item_id])
  end
end
