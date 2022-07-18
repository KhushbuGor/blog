class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
      @post = Post.find(params[:id])
  end

  def new 
      @post = Post.new
  end 

  def create 
      @post = Post.new(post_params)

      if @post.save
          redirect_to author_post_path(params[:author_id],@post)
      else
          render :new, status: :unprocessable_entity
      end
  end

  def edit
      @post = Post.find(params[:id])
  end
  def update
      @post = Post.find(params[:id])

      
      if @post.update(post_params)
          redirect_to author_post_path(@post.author)
      else
          render :edit, status: :unprocessable_entity
      end
  end
  def destroy
      @post = Post.find(params[:id])
      @post.destroy 
      redirect_to author_posts_path(@post.author), status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:author_id,:title, :text)
  end
end
