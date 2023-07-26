class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @customer = current_customer
    @cart_item = CartItem.new
  end
  
  private
  
	def params_item
		parmas.require(:item).permit(:image ,:name )
	end
  
end
