class PostsController < ApplicationController
    
    def index
        
        @posts = Post.all
        
    end
    
    def new
       
       @post = Post.new
        
    end
    
    def edit
        
    end
    
    def show
        
    end
    
    def create

    @post = Post.new(post_params)
    if @post.save
       redirect_to root_path
    else
        rendirect_ro new_post_path
    end
    
    end
    
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
    
      redirect_to root_path
    end
    
     
    
    private
    
    def post_params
    
    params.require(:post).permit(:image,:caption)
    
    end
    
end
