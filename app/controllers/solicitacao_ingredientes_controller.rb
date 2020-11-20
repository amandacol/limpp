class SolicitacaoIngredientesController < ApplicationController
  before_action :set_solicitacao_ingrediente, only: [:show, :edit, :update, :destroy]
  def new
    @solicitacao_ingrediente = SolicitacaoIngrediente.new
    authorize @solicitacao_ingrediente
  end

  def create
    @solicitacao_ingrediente = SolicitacaoIngrediente.new(solicitacao_ingrediente_params)
    authorize @solicitacao_ingrediente
    if @solicitacao_ingrediente.save
      redirect_to sendtous_path
    else
      render :new
    end
  end

  def index
    @solicitacao_ingredientes = policy_scope(SolicitacaoIngrediente)
  end

  def show
  end

  private

  def set_solicitacao_ingrediente
    @solicitacao_ingrediente = SolicitacaoIngrediente.find(params[:id])
    authorize @solicitacao_ingrediente
  end

  def solicitacao_ingrediente_params
    params.require(:solicitacao_ingrediente).permit(:email, :ingrediente, :obs)
  end
end
