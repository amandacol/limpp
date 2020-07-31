class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]


  def show
    @user = User.find(params[:id])
    authorize @user
    @items = @user.items
  end

  def index
    @users = User.where.not(id: current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
