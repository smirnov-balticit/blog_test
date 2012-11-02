class PostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def index
    @tag = params[:tag_name]
    if @tag
     @posts = Post.tagged_with(@tag).paginate(:per_page => 5, :page => params[:page])
    else
     @posts = Post.paginate(:per_page => 5, :page => params[:page])
    end
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_path
    else
      @feed_items = []
      redirect_to root_path
    end
  end
  
  def destroy
    @post.destroy
    redirect_to(:back)
  end

 def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end


 private

    def authorized_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_path if @post.nil?
    end

end
