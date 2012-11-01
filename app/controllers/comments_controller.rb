class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])

    redirect_to @post
    if signed_in?
       @user_id = current_user.id
    end
    @comment = @post.comments.new(params[:comment])
    @comment.user_id = @user_id
    @comment.save
  end

end
