class ContentsController < ApplicationController
    before_action :authenticate_user!
    def index
        @category = Category.find(params[:category_id])
        @contents = @category.contents
    end
    
    def create
        @content = Content.new(content_params)
        @content.category_id = params[:category_id]
        @content.save
        redirect_to category_contents_path(params[:category_id])
    end
    
    def new
        @content = Content.new
    end
    
    def show
        @content = Content.find(params[:id])
    end
    
    def download
        @content = Content.find(params[:id])
        filepath = @content.file.current_path
        # send_data(@content.text,:filename=>@content.text_identifier
        stat = File::stat(filepath)
        # send_file(filepath, :filename => @picture.picture_identifier, :length => stat.size)
        # send_data(@content.file.read,:filename=>@content.file_identifier)
        send_file(filepath, :filename => @content.file_identifier, :length => stat.size)
    end
    
    def edit
        @content = Content.find(params[:id])
    end
    
    def update
        @content = Content.find(params[:id])
        @content.update(content_params)
        redirect_to category_contents_path(@content.category)
    end
    
    def destroy
    end
    
    private
    
    def content_params
        params.require(:content).permit(:name,:text,:file)
    end
end
