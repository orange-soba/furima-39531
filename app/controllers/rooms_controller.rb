class RoomsController < ApplicationController
  before_action :set_data, only: [:index, :edit]
  def index
  end

  def edit
  end

  def update
    @room = Room.find(params[:id])
    @item = Item.find(room_params[:item_id])
    if @room.update(room_params)
      redirect_to item_rooms_path(@item.id)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_data
    @item = Item.find(params[:item_id])
    @room = @item.room
  end

  def room_params
    params.require(:room).permit(:limit).merge(item_id: params[:item_id])
  end
end
