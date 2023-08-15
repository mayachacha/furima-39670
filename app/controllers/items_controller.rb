class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

def index
  @items = Item.includes(:user).order(created_at: :desc)
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  if @item.save && @item.image.attached?
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
  unless current_user.id == @item.user_id
  redirect_to root_path
  end
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
def item_params
params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)

end
end

#  @item.image.attached? &&