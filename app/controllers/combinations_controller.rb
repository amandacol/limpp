class CombinationsController < ApplicationController
  before_action :set_combination, only: [:show, :edit, :update, :destroy]
  def new
    @combination = Combination.new
    authorize @combination
  end

  def create
    @combination = Combination.new(combination_params)
    authorize @combination

    if @combination.save
      redirect_to combinations_path
    else
      render :new
    end

  end

  def index

  end

  def show

  end

  def edit
  end

  def update

  end


  def destroy
    @combination.destroy
    redirect_to combinations_path
  end

  private

  def set_combination
    @combination = Combination.find(params[:id])
    authorize @combination
  end

  def combination_params
    params.require(:combination).permit(:item_id, :ingredient_id )
  end
end
