class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    if @item.user_id != current_user.id && @item.order.present?
      redirect_to root_path
    elsif @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if @order_address.valid?
      
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private
  def order_params
    item_price = @item.price 
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :street_address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  

  def pay_item
    item_price = @item.price 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end