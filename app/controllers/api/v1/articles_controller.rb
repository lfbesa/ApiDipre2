module Api
      module V1
    class ArticlesController < ActionController::API
      before_action :set_article, only: [:show, :update, :destroy]
      before_action :authenticate_token


      # GET /articles
      def index
        if @is_authenticated
          @article = Article.where("created_at >= ?", 60.days.ago).order(publishedAt: :desc)

          render json: @article
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # GET /articles/1
      def show
        if @is_authenticated
          render json: @article
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # POST /articles
      def create
        if @is_authenticated
          @article = Article.new(article_params)

          if @article.save
            render json: @article, status: :created, location: @article
          else
            render json: @article.errors, status: :unprocessable_entity
          end
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # PATCH/PUT /articles/1
      def update
        if @is_authenticated
          if @article.update(article_params)
            render json: @article
          else
            render json: @article.errors, status: :unprocessable_entity
          end
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # DELETE /articles/1
      def destroy
        if @is_authenticated
          @article.destroy
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      private
        #This is to authenticate that the call is set from an account of the front-end
        def authenticate_token
          @is_authenticated = false
          if request.headers["TOKEN"]
            if request.headers["TOKEN"] == "AppDipre"
              @is_authenticated = true
            end
          end
        end
        # Use callbacks to share common setup or constraints between actions.
        def set_article
          @article = Article.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def article_params
          params.require(:article).permit(:title, :description, :date, :epigraph, :to_date, :url, :hour)
        end
    end
  end
end
