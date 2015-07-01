class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.comments.create(comment_params)
    redirect_to :back, :notice => "Added Comment"
  end

  def destroy
    current_user.comments.destroy(params[:id])
    redirect_to :back, :notice => "Removed Comment"
  end

  private

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body)
  end
end
