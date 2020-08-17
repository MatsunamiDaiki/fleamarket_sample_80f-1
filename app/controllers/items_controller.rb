class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images)
    @items_index = @items.order(updated_at: :desc).page(params[:page]).per(5)
    @parents = Category.where(ancestry: nil)
    @ladies = Category.find(1).subtree
    @ladies_items = Item.where(category_id: @ladies)
    @last_ladies_item = @ladies_items.last
    @mens = Category.find(196).subtree
    @mens_items = Item.where(category_id: @mens)
    @last_mens_item = @mens_items.last
    @babies = Category.find(327).subtree
    @babies_items = Item.where(category_id: @babies)
    @last_babies_item = @babies_items.last
    @hobbies = Category.find(661).subtree
    @hobbies_items = Item.where(category_id: @hobbies)
    @last_hobbies_item = @hobbies_items.last
    @appliances= Category.find(874).subtree
    @appliances_items = Item.where(category_id: @appliances)
    @last_appliances_item = @appliances_items.last
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_name], ancestry: nil).children
  end


  def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else 
      redirect_to new_item_path
    end  
  end

  def edit
    @item = Item.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end  

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:explain,:status_id,:delivery_cost_id,:area_id,:brand,:limit_id,:price,:category_id,images_attributes: [:image, :_destroy, :id])
  end
end
