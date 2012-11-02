class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if signed_in?
       @user_id = current_user.id
    end
    @comment = @post.comments.new(params[:comment])
    @comment.user_id = @user_id
    @comment.save
    redirect_to @post
  end

end
