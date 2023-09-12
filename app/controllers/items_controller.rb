class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_index
    user_id = @item.user_id
    return if current_user.id == user_id

    redirect_to root_path
  end

  def item_params
    permit_arr = [:image, :name, :explanation, :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_day_id, :price]
    params.require(:item).permit(permit_arr).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
