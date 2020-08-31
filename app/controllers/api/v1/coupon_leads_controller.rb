class Api::V1::CouponLeadsController < Api::V1::BaseController

  after_action :verify_authorized, except: [:show, :create_coupon]
  before_action :authenticate_user!, except: [:create_coupon]
  # before_action :login_required, except: [:create]


  def show
    render json: 'teste'
  end

  def create_coupon

    @coupon_tracker = CouponTracker.new(coupon_tracker_params)

    if @coupon_tracker.save
      render json: { coupon_tracker: @coupon_tracker.as_json }, status: 200
    else
      render json: { errors: @coupon_tracker.errros.full_messages }, status: 422
    end

  end

  private

  def coupon_tracker_params
    params.require(:coupon_tracker).permit(:coupon_name, :customer)
  end

end
