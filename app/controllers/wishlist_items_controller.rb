class WishlistItemsController < ApplicationController
  before_action :set_wishlist_item, only: [:show, :edit, :update, :destroy]
  def new
    @wishlist_item = WishlistItem.new
   @wishlist_item.item_id = params[:item_id]
    authorize @wishlist_item
  end

  def create
    @item = Item.find(params[:item_id])
    @wishlist_item = WishlistItem.new
    authorize @wishlist_item
    @wishlist_item.user = current_user
    @wishlist_item.save
    redirect_to items_path, notice: "Adicionado a sua lista de desejos!"

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
    @wishlist_item = WishlistItem.find(params[:id])
    authorize @wishlist_item
  end

  def wishlist_item_params
    params.require(:wishlist_item).permit(:item_id, :wishlist_id, :wishlist_item_id)
  end
end
