class OrdersController < ApplicationController
  before_action :item_exists_check
  before_action :set_item_gon
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order
      @order_address.save
      @order_address.create_room
      send_mail
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def item_exists_check
    return if Item.exists?(params[:item_id])

    redirect_to root_path
  end

  def move_to_index
    user_id = @item.user_id
    return if (current_user.id != user_id) && !@item.order

    redirect_to root_path
  end

  def order_params
    item_id = params[:item_id]
    token = params[:token]
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: item_id, token: token)
  end

  def set_item_gon
    @item = Item.find(params[:item_id])
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def pay_order
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy',
    )
  end

  def send_mail
    item = Item.find(params[:item_id])
    buyer = item.order.user
    seller = item.user
    UserMailer.with(user: buyer, item: item).order_mail_buyer.deliver_later
    UserMailer.with(user: seller, item: item).order_mail_seller.deliver_later
  end
end
