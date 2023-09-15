class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :item_sold

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    user_id = @item.user_id
    return if current_user.id != user_id

    redirect_to root_path
  end

  def item_sold
    if Order.find_by(item_id: @item.id)
      redirect_to root_path
    end
  end

  def order_params
    item_id = params[:item_id]
    token = params[:token]
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: item_id, token: token)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_order
    Payjp.api_key = 'sk_test_239743be9188d7125b6578f5'
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy',
    )
  end
end
