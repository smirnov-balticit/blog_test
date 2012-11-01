class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy 
  
  def index
    @title = "All users"
    @users = User.paginate(:per_page => 10, :page => params[:page])
  end



    def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page])
    @title = @user.name
    if signed_in?
      @post = Post.new
    end
  end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
	  sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"
  end
  
    def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
    
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def tag
    @posts = Post.tagged_with(params[:tag_name])
    @tags = Post.tag_counts_on(:tags)
    render 'posts/index'
  end


  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

    def authenticate
      deny_access unless signed_in?
    end
	
	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  
  end
