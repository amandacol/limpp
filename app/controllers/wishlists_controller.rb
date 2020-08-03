class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:destroy]

  def index
    @user_items = current_user.items
    @user_wishlists = current_user.wishlists
    if params[:query].present?
        @wishlists = policy_scope(Wishlist).multisearchable(params[:query])
      else
        @wishlists = policy_scope(Wishlist)
      end
  end

  def create
    @item = Item.find(params[:item_id])
    @wishlist = Wishlist.new
    authorize @wishlist
    @wishlist.item = @item
    @wishlist.user = current_user
    if @wishlist.save
    redirect_to items_path, notice: "Adicionado a sua lista de desejos!"
    else
    redirect_to items_path, notice: "Você já adicionou esse item."
    end
  end


  def destroy
    @wishlist.destroy
    authorize @wishlist
    redirect_to wishlists_path
  end



  private


  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
  end

  def wishlist_params
    params.require(:wishlist).permit(:date)
  end

  def filter_params
    params.require(:wishlist).permit(:wishlist_id)
  end
end
