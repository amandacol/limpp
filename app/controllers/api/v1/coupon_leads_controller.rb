class Api::V1::CouponLeadsController < ApplicationController

  after_action :verify_authorized, except: [:show]

  def show
    render json: 'teste'
  end

end
