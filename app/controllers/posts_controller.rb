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
    
    respond_to do |format|
      if @post.save
        format.html {  redirect_to author_post_path(@post.author, @post), notice: "Post was successfully created." }
                 
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
      @post = Post.find(params[:id])
  end
  def update
      @post = Post.find(params[:id])
    respond_to do |format|      
      if @post.update(post_params)
        format.html {         redirect_to author_post_path(@post.author), notice: "Post was successfully updated." }

      else
        format.html { render :edit, status: :unprocessable_entity }
      end
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
