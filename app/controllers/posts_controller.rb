class PostsController < ApplicationController
  def index
    @post = Post.new
     @posts = Post.all.order("posts.created_at desc")
  end

  def new
     @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
    else
      render 'new'
    end
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
     format.html { redirect_to posts_path }
     format.json { head :no_content }
     format.js   { render :layout => false }
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end
    
    private
  def post_params
    params.require(:post).permit(:user_id, :description, :image)
  end
end
