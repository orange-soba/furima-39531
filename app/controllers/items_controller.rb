class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :item_exists_check, only: [:show, :edit, :update, :destroy]
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

  def search
    if params[:q]&.dig(:name)
      names = params[:q][:name].squish.split(" ")
      params[:q][:name_cont_any] = names
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  private

  def item_exists_check
    return if Item.exists?(params[:id])

    flash[:alert] = "IDが#{params[:id]}の商品は存在しません"
    redirect_to root_path
  end

  def move_to_index
    user_id = @item.user_id
    return if (current_user.id == user_id) && !@item.sold

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
