class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def body 
    params_id
    render plain: @post.content
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id 
      @post.category_id = params[:category_id]
      @post.save

      render json: @post, status: 201
  end

  def edit
    params_id
  end

  def update 
    params_id
    @post.update(post_params)
    @post.category_id = params[:category_id]
    @post.user = current_user
    @post.save
    redirect_to user_posts_path(current_user)
  end

  def show 
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @post}
    end
  end

  def destroy
    params_id.destroy
    redirect_to user_posts_path(current_user)
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  def params_id
    @post = Post.find(params[:id])
  end

end ## class end
