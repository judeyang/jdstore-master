class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout 'admin'

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
    render formats: :js
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update(product_params)
      respond_to do |format|
        format.js
        format.any { render text: 'WTF' }
      end
    else
      render :edit
    end
  end

  def new
    @product = Product.new
 
    render formats: :js
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      respond_to do |format|
        format.js
        format.any { render text: 'WTF' }
      end
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    
    @product.destroy
    render formats: :js
    # redirect_to admin_products_path, alert: 'Product deleted'
  end

  private
    
  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image)
  end
end
