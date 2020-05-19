class NewitemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def new
    @newitem = Newitem.new
    authorize @newitem
  end

  def create
    @newitem = Newitem.new(newitem_params)
    authorize @newitem

    if @newitem.save
      redirect_to sendtous_path
    else
      render :new
    end
  end

  def index
    @newitems = policy_scope(Newitem)
  end

  def show
  end

  private

  def set_newitem
    @newitem = Newitem.find(params[:id])
    authorize @newitem
  end

  def newitem_params
    params.require(:newitem).permit(photos: [])
  end
end
