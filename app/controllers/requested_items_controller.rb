class RequestedItemsController < ApplicationController
  before_action :set_requested_item, only: [:show, :edit, :update, :destroy]
  def new
    @requested_item = RequestedItem.new
    authorize @requested_item
  end

  def create
    @requested_item = RequestedItem.new(requested_item_params)
    authorize @requested_item
    @requested_item.user = current_user
    if @requested_item.save
      redirect_to sendtous_path
    else
      render :new
    end
  end

  def index
    @requested_items = policy_scope(RequestedItem)
  end

  def show
  end

  private

  def set_requested_item
    @requested_item = RequestedItem.find(params[:id])
    authorize @requested_item
  end

  def requested_item_params
    params.require(:requested_item).permit(:email, photos: [])
  end
end
