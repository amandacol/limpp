class MergersController < ApplicationController
  before_action :set_merger, only: [:show, :edit, :update, :destroy]
  def new
    @merger = Merger.new
    authorize @merger
  end

  def create
    @merger = Merger.new(merger_params)
    authorize @merger

    if @merger.save
      redirect_to mergers_path
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
    @merger.destroy
    redirect_to mergers_path
  end

  private

  def set_merger
    @merger = Merger.find(params[:id])
    authorize @merger
  end

  def merger_params
    params.require(:merger).permit(:purpose_id, :ingredient_id )
  end
end
