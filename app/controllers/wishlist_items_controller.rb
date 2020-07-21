class WishlistItemsController < ApplicationController
  before_action :set_wishlist_item, only: [:show, :edit, :update, :destroy]
  def new
    @wishlist_item = Wishlist_item.new
    authorize @wishlist_item
  end

  def create
    @wishlist_item = Wishlist_item.new(wishlist_item_params)
    authorize @wishlist_item

    if @wishlist_item.save
      redirect_to wishlist_items_path
    else
      render :new
    end

  end

  def index

  end

  def show

  end

  def edit
  end

  def update

  end


  def destroy
    @wishlist_item.destroy
    redirect_to wishlist_items_path
  end

  private

  def set_wishlist_item
    @wishlist_item = Wishlist_item.find(params[:id])
    authorize @wishlist_item
  end

  def wishlist_item_params
    params.require(:wishlist_item).permit(:item_id, :wishlist_id )
  end
end
