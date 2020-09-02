class Api::V1::CouponLeadsController < Api::V1::BaseController

  after_action :verify_authorized, except: [:show, :create_coupon]
  before_action :authenticate_user!, except: [:create_coupon]


  def create_coupon

    @coupon_tracker = CouponTracker.new(coupon_tracker_params)

    # Get the current coupon to save on tracker
    @coupon = Coupon.find_by(name: params[:coupon_tracker][:coupon_name])

    @coupon_tracker.coupon = @coupon
    @coupon_tracker.partner = @partner

    if @coupon_tracker.save
      render json: { coupon_tracker: @coupon_tracker.as_json }, status: 200
    else
      api_log = ApiLog.create(
                  status: 422,
                  partner: @partner,
                  coupon: @coupon,
                  error: @coupon_tracker.errors.full_messages,
                  details: "Authorization Token: #{request.headers['Authorization']}"
                )
      render json: { errors: @coupon_tracker.errors.full_messages }, status: 422
    end

  end

  private

  def coupon_tracker_params
    params.require(:coupon_tracker).permit(:coupon_name, :customer)
  end

end
