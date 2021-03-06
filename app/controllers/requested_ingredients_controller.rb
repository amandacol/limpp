class RequestedIngredientsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_requested_ingredient, only: [:show, :edit, :update, :destroy]
  def new
    @requested_ingredient = RequestedIngredient.new
    authorize @requested_ingredient
  end

  def create
    @requested_ingredient = RequestedIngredient.new(requested_ingredient_params)
    authorize @requested_ingredient
    @requested_ingredient.user = current_user
    if @requested_ingredient.save
      redirect_to sendtous_path
    else
      render :new
    end
  end

  def index
    @requested_ingredients = policy_scope(RequestedIngredient)
  end

  def show
  end

  private

  def set_requested_ingredient
    @requested_ingredient = RequestedIngredient.find(params[:id])
    authorize @requested_ingredient
  end

  def requested_ingredient_params
    params.require(:requested_ingredient).permit(:email, :name, :comment)
  end
end
