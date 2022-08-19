module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: :destroy

      def index
        @categories = Category.all
        render json: CategoriesRepresenter.new(@categories).as_json #as_json is a custom method
        #CategoriesRepresenter is our own custom helper we use to render json, found in Representers folder
      end

      def create
        @category = Category.create(category_params)
        if @category.save
          render json: CategoryRepresenter.new(@category).as_json, status: :created
        #CategoryRepresenter is our own custom helper we use to render json, found in Representers folder
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @category.destroy
        head :no_content
      end

      private
      def category_params
        params.permit(:name)
      end

      def set_category
        @category = Category.find(params[:id])
      end
    end
  end
end
