class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :owner_user!, except: %i[index create]

  def index
    @orders = current_user.orders.order("id DESC")
  end

  def show
    @product_lists = @order.product_lists
  end
  
  def cancel
    @order.cancel_order!
    redirect_to :back
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = @order.product_lists.build
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end
      current_cart.clear!
      OrderMailer.notify_order_placed(@order).deliver!
      redirect_to account_order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def pay_with_alipay
    @order.set_payment_with!('alipay')
    @order.make_payment!

    redirect_to account_order_path(@order.token), notice: '使用支付宝付款成功！'
  end

  def pay_with_wechat
    @order.set_payment_with!('wechat')
    @order.make_payment!

    redirect_to account_order_path(@order.token), notice: '使用微信付款成功！'
  end
  

  def return
    @order.return_good!
    redirect_to :back
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
  
  def owner_user!
    @order = current_user.orders.find_by_token(params[:id])
    unless current_user == @order.user
      flash[:danger] = '无法操作次订单！'
      redirect_to root_path
    end
  end
end
