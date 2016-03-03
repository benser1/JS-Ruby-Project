class AllController < ApplicationController

  helper_method :sort_column,  :sort_direction

  def index
    @posts = Post.order(sort_column + " " + sort_direction) 
    @posts = Post.order(updated_at: :desc).page(params[:page])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to user_posts_path(current_user)
  end

  private 

  def sort_column
    params[:sort] || "title"
  end

  def sort_direction
    params[:direction] || "asc"
  end


end ## class end
