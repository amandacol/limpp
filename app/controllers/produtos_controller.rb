class ProdutosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  def new
    @produto = Produto.new
    authorize @produto
  end

  def create
    @produto = Produto.new(produto_params)
    authorize @produto
    if @produto.save
      render :thanks
    else
      render :new
    end
  end

  def index
    @produtos = policy_scope(Produto)
  end

  def show
  end

  private

  def set_produto
    @produto = Produto.find(params[:id])
    authorize @produto
  end

  def produto_params
    params.require(:produto).permit(:email, :url, photos: [])
  end
end
