class MessagesController < ApplicationController
  before_action :set_data

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      send_mail
      redirect_to item_rooms_path(@item.id)
    else
      @messages = Message.where(room_id: @room.id)
      render 'rooms/index', status: :unprocessable_entity
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to item_rooms_path(@item.id)
  end

  private

  def set_data
    @item = Item.find(params[:item_id])
    @room = @item.room
  end

  def message_params
    params.require(:message).permit(:message).merge(room_id: @room.id, user_id: current_user.id)
  end

  def send_mail
    if @message.user == @item.user
      user = @item.order.user
    else
      user = @item.user
    end
    UserMailer.with(user: user, item: @item, message: @message.message).communicate_mail.deliver_later
  end
end
