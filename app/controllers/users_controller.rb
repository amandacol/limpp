class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  after_create :add_wishlist

  def show
    @user = User.find(params[:id])
    authorize @user
    @items = @user.items
  end

  def index
    if params[:query].present?
      @users = policy_scope(User).search_by_name_and_ingredient(params[:query])
    else
      @users = policy_scope(User)
    end
  end

  def add_wishlist
    @wishlist = Wishlist.new(current_user.id)
    @wishlist.save
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
