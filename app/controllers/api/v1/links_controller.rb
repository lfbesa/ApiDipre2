module Api
  module V1
    class LinksController < ActionController::API
      before_action :set_link, only: [:show, :update, :destroy]
      before_action :authenticate_token


      # GET /links
      def index
        if @is_authenticated
          @link = Link.all

          render json: @link
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # GET /links/1
      def show
        if @is_authenticated
          render json: @link
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # POST /links
      def create
        if @is_authenticated
          @link = Link.new(link_params)

          if @link.save
            render json: @link, status: :created, location: @link
          else
            render json: @link.errors, status: :unprocessable_entity
          end
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # PATCH/PUT /links/1
      def update
        if @is_authenticated
          if @link.update(link_params)
            render json: @link
          else
            render json: @link.errors, status: :unprocessable_entity
          end
        else
          render status: 403, json: {
            message: "No TOKEN auth."
          }.to_json
        end
      end

      # DELETE /links/1
      def destroy
        if @is_authenticated
          @link.destroy
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
        def set_link
          @link = Link.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def link_params
          params.require(:link).permit(:title, :description, :url)
        end
    end
  end
end
