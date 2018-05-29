class PostsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
    
    def index
        
        @posts = Post.order("created_at DESC").all
        
    end
    
    def new
       
       @post = Post.new
       @comment = Comment.new(post_id: params[:post_id])
        
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
    
     def upvote
         
         @post.upvote_from current_user
         redirect_to root_path
         
     end
     
     def downvote
         
         @post.downote_from current_user
         redirect_to root_path
     end
     
    
    private
    
    def post_params
    
    params.require(:post).permit(:image,:caption)
    
    end
    
    def set_post
        @post = Post.find(params[:id])
    end
    
end
