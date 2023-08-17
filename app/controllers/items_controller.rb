class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
end



def edit  
  if current_user.id == @item.user_id && @item.order.present?
  redirect_to root_path
  end
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  item = Item.find(params[:id])
  if user_signed_in? && current_user.id == item.user_id
    item.destroy
    redirect_to root_path
  else
    redirect_to item_path(item.id)
  end
end


private
def item_params
params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

end

#  @item.image.attached? &&