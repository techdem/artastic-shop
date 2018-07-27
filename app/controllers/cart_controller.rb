class CartController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
  
  def add
    id = params[:id]
    
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    
    cart[id] = 1    # User can only add one item of each in the basket
    
    redirect_back(fallback_location: root_path)
  end
  
  def remove
    
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :cart
  end
  
  def clearCart
    
    session[:cart] = nil
    redirect_to :action => :index
  end
  
  def createOrder
    if !session[:cart].blank?   # Prevent order duplication and empty orders
      @user = User.find(current_user.id)
      @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending')
      @order.save
      @cart = session[:cart]
      @cart.each do |id,quantity|
        item = Item.find_by_id(id)
        @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price => item.price)
        @orderitem.save
      end
    end
    
    @orders = Order.all
    @orderitems = Orderitem.where(order_id: Order.last)
    session[:cart] = nil
  end
end
