class Public::HomesController < ApplicationController
  
  def top
    @items = Item.all
    @random = Item.order("RANDOM()").limit(4)
  end

  def about
  end
  
end
