class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit]
  before_action :set_item, only: [:index, :create, :new]


  def new
    @coupon = Coupon.new
    @coupon.item = @item
    authorize @coupon
  end

  def index
    @coupons = policy_scope(Coupon)
    @item = Item.new
  end

  def show
    @item = Item.new
  end

  def edit
  end

  def create
    @coupon = coupon.new(Coupon_params)
    @coupon.user = current_user
    @coupon.item = @item
    authorize @coupon
    if @coupon.save
      redirect_to item_path(@item)
    else
      flash[:alert] = "Algo deu errado."
      render :new
    end
    update_product_average(@coupon)
  end

  private

    def set_coupon
      @coupon = Coupon.find(params[:id])
      authorize @coupon
    end

    def set_item
      @item = Item.find(params[:item_id])
      authorize @item
    end

    def coupon_params
      params.require(:coupon).permit(:content, :website, :item_id)
    end
end
