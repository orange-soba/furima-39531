class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items.order('created_at DESC')
    @graph = BuildGraph.new(@items).build_graph
    # BuilGraphは app/services にあります
  end
end
