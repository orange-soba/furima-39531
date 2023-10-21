class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    item_id = params[:item_id]
    if @comment.valid?
      @comment.save
      redirect_to item_path(item_id)
    else
      @item = Item.find(item_id)
      render 'items/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
