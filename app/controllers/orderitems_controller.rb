class OrderitemsController < ApplicationController
  def index
    @orderitems = Orderitem.all
  end

  def show
    @orderitems = Orderitem.all
  end

  def new
  end

  def edit
  end
end
