class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to all_index_path
  end

  def destroy
      @comment = Comment.find(params[:id]).destroy
      redirect_to all_index_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
