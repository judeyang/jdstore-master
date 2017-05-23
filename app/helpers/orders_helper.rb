module OrdersHelper

  def render_order_paid_state(order)
    if order.is_paid?
      content_tag  :label, '订单已付款', class: 'ui large teal header'
    else
      content_tag  :label, '订单未付款', class: 'ui large red header'
    end
  end

end
