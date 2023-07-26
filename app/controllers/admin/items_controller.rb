class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] ="Item was successfully created"
      redirect_to admin_item_path(@item) 
    else
      render :new
    end
  end
  
  def index
    @items = Item.all.page(params[:page]).per(10)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] ="Item was successfully updated"
      redirect_to admin_item_path(@item)
    else
      render :show
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end
end
