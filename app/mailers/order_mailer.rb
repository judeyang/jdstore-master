class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail to: @user.email, subject: "[七城工作室]感谢你完成本次的下单，以下是您这次的购物明细 #{@order.token}"
  end
end
