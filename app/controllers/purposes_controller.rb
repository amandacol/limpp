class PurposesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_purpose, only: [:show, :edit, :update, :destroy]
  def new
    @purpose = Purpose.new
    authorize @purpose
  end

  def create
    @purpose = Purpose.new(purpose_params)
    authorize @purpose

    if @purpose.save
      redirect_to purposes_path
    else
      render :new
    end

  end

  def index
    @purposes = policy_scope(purpose)
  end

  def show
  end

  def edit
  end

  def update

  end


  def destroy
    @purpose.destroy
    redirect_to purposes_path
  end

  private

  def set_purpose
    @purpose = Purpose.find(params[:id])
    authorize @purpose
  end

  def purpose_params
    params.require(:purpose).permit(:name, :classification, :impact, :article )
  end
end
