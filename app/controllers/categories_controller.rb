class CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = Category.all
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        @category.save
        redirect_to categories_path
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name,:status)
    end
end
