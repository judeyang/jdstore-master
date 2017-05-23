module CartsHelper
  def render_cart_total_price(cart)
    cart.total_price
  end

  def current_cart
    current_user.cart
  end
end
