class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    authorize @item

    if @item.save
      redirect_to items_path
    else
      render :new
    end

  end

  def index
    @wishlist = Wishlist.new
    @review = Review.new
    if params[:query].present?
      @items = policy_scope(Item).search_by_name_and_ingredient(params[:query])
    else
      @items = policy_scope(Item)
    end
  end

  def tagged
  if params[:tag].present?
    @items = Item.tagged_with(params[:tag])
  else
    @items = Item.all
  end
end

  def show
    @wishlist = Wishlist.new
    @coupon = Coupon.new
    @reviews = @item.reviews
    @review = Review.new
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
  end
  end



  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:name, :ingredient, :photo, :tag, :average, :category_list, :subcategory_list, :toxicity_list, certification_photos: [])
  end
end
