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
      @filter = params["search"]["category"].concat(params["search"]["subcategory"]).concat(params["search"]["average"]).flatten.reject(&:blank?)
      @items = policy_scope(Item).search_by_name_and_ingredient(params[:query]).tagged_with(@filter, any: true)
    else
      @items = policy_scope(Item)
    end
  end

  def show
    @wishlist = Wishlist.new
    @coupon = Coupon.new
    @reviews = @item.reviews
    @review = Review.new
    @item = Item.find(params[:id])
    @related_items = @item.find_related_tags
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
    params.require(:item).permit(:name, :ingredient, :category, :subcategory, :photo, :average, :tag_list, certification_photos: [])
  end
end
