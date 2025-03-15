class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    before_action :set_article, only: [:show, :update, :destroy]

    # Afficher uniquement les articles publiés
    def index
        @articles = Article.published
    end

    # Afficher un article spécifique
    def show
        @article = Article.find(params[:id])
    end

    # Créer un nouvel article (nécessite une authentification)
    def create
        @article = Article.new(article_params)
        @article.author = current_user.email
        authorize @article

        if @article.save
            render json: @article, status: :created
        else
            render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # Modifier un article existant (seul l'auteur peut le faire)
    def update
        authorize @article

        if @article.update(article_params)
            render json: @article, status: :ok
        end
    end

    # Supprimer un article existant (seul l'auteur peut le faire)
    def destroy
        authorize @article
        @article.destroy
        head :no_content
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content, :published_at)
    end
    
end
