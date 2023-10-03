class RoomsController < ApplicationController
  before_action :set_data
  before_action :check_limit
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @messages = Message.where(room_id: @room.id)
    @message = Message.new
  end

  def update
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

  def check_limit
    if Time.now > @room.limit
      @room.destroy
      redirect_to root_path
    end
  end

  def move_to_index
    return if @room && (current_user.id == @item.user.id || current_user.id == @item.order.user.id)

    redirect_to root_path
  end
end
