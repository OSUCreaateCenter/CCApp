class ContentsController < ApplicationController
    def index
        @category = Category.find(params[:category_id])
        @contents = @category.contents
    end
    
    def create
        @content = Content.new(content_params)
        @content.category_id = params[:category_id]
        @content.save
        redirect_to categories_path
    end
    
    def new
        @content = Content.new
    end
    
    def show
        @content = Content.find(params[:id])
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def content_params
        params.require(:content).permit(:name,:text,:image)
    end
end
