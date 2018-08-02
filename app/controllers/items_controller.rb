class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def search
    @search_term = params[:q]
    search = "%#{params[:q]}%"
    @items = Item.where("title like ? OR author like ? OR category like?", search, search, search)    # Search title, author and category fields
  end
  
  def filter
    @filter_term = params[:f]
    filter = "%#{params[:f]}%"
    @items = Item.where("category like?", filter)   # Filter items by category
  end
  
  def curate_approve    # Method for approving items
    Item.find(params[:id]).update_attribute(:approved, 1)
    redirect_to :curate
  end
  
  def curate_disapprove   # Method for hiding items
    Item.find(params[:id]).update_attribute(:approved, 0)
    redirect_to :curate
  end
  
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item created and awaiting approval.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :price, :category, :author, :image)    # Item has an image parameter
    end
end
