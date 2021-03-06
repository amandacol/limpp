class IngredientsController < ApplicationController
skip_before_action :authenticate_user!
before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient

    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end

  end

  def index
    if params[:query].present?
      @ingredients = policy_scope(Ingredient).search_by_name(params[:query])
    elsif params[:search].present?
      @filter = params["search"]["type"].concat(params["search"]["vegan"]).flatten.reject(&:blank?)
      @ingredients = policy_scope(Ingredient).order(toxicity_ingredient: :asc).search_by_name("#{@filter}")
    elsif case params[:order]
      when 'cleanesti'
      @ingredients = policy_scope(Ingredient).order(toxicity_ingredient: :asc)
    when 'dirtiest'
      @ingredients = policy_scope(Ingredient).order(toxicity_ingredient: :desc)
    else
      @ingredients = policy_scope(Ingredient)
    end
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
  end
  end


  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :classification, :impact, :order, :tag_list, :article )
  end
end
