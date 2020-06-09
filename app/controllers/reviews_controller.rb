class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit]
  before_action :set_item, only: [:index, :create, :new]


  def new
    @review = Review.new
    @review.item = @item
    authorize @review
  end

  def index
    @reviews = policy_scope(Review)
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.item = @item
    authorize @review
    if @review.save
      redirect_to item_path(@item)
    else
      flash[:alert] = "Algo deu errado."
      render :new
    end
    update_product_average(@review)
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def update_product_average(review)
      @review = review
      @product = @review.item
      @product.average = @product.calculate_average
      @product.save
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def review_params
      params.require(:review).permit(:rating, :buyagain, :item_id)
    end
end
