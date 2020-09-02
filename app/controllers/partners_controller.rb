class PartnersController < ApplicationController

  def new
    @partner = Partner.new
    authorize @partner
  end

  def create
    @partner = Partner.new(partner_params)
    authorize @partner

    if @partner.save
      flash[:notice] = "Parceiro criado com sucesso!"
      redirect_to root_path
    else
      flash[:notice] = "Parceiro não pode ser criado"
      render :new
    end
  end


  private

  def partner_params
    params.require(:partner).permit(:name, :email)
  end
end
