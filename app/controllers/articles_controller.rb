class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit]
  before_action :set_ingredient, only: [:index, :create, :new]


  def new
    @article = Article.new
    @article.ingredient = @ingredient
    authorize @article
  end

  def index
    @articles = policy_scope(Article)
    @ingredient = Ingredient.new
  end

  def show
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @article = article.new(Article_params)
    @article.user = current_user
    @article.ingredient = @ingredient
    authorize @article
    if @article.save
      redirect_to ingredient_path(@ingredient)
    else
      flash[:alert] = "Algo deu errado."
      render :new
    end
    update_product_average(@article)
  end

  private

    def set_article
      @article = Article.find(params[:id])
      authorize @article
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:ingredient_id])
      authorize @ingredient
    end

    def article_params
      params.require(:article).permit(:content, :website, :ingredient_id, :name)
    end
end
