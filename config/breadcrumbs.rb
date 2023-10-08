crumb :root do
  link "Home", root_path
end

crumb :user_show do
  id = params[:id]
  link "ユーザー詳細", user_path
  parent :root
end

crumb :search do
  link "検索一覧", search_items_path
  parent :root
end

crumb :item_show do
  id = params[:item_id] ||= params[:id]
  link "商品詳細", item_path(id)
  parent :root
end

crumb :item_edit do
  link "商品編集", edit_item_path(params[:id])
  parent :item_show
end

crumb :order do
  link "商品購入", item_orders_path(params[:item_id])
  parent :item_show
end

crumb :room do
  link "コミュニケーションページ", item_rooms_path(params[:item_id])
  parent :item_show
end