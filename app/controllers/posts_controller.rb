class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(current_user)
  end

  def body 
    @post = Post.find(params[:id])
    render plain: @post.content
  end

  def new
    @post = Post.new # instantiating a post
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id 
      @post.category_id = params[:category_id]
      @post.save

      redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    @post.update(post_params)
    @post.category_id = params[:category_id]
    @post.user = current_user
    @post.save
    redirect_to post_path(@post)
  end

  def show 
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @post}
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path(current_user)
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :category_name)
  end

end ## class end
