class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_index
    user_id = Item.find(params[:id]).user_id
    return if current_user.id == user_id

    redirect_to root_path
  end

  def item_params
    permit_arr = [:image, :name, :explanation, :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_day_id, :price]
    params.require(:item).permit(permit_arr).merge(user_id: current_user.id)
  end
end
