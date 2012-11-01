require 'spec_helper'
describe Post do

	  before(:each) do
		@user = Factory(:user)
		@attr1 = {:content => "value for content" }

		@attr2 = { :ptitle  =>"hello",:content => "value for content" }
		@post=@user.posts.create!(@attr2)
	  end

	  it "should create a new instance given valid attributes" do
			@post.comments.create(@attr1)
	  end
     describe "post associations" do

		before(:each) do
		  @comment = @post.comments.create(@attr1)
		end

		it "should have a user attribute" do
		  @comment.should respond_to(:post)
		end

		it "should have the right associated user" do
		  @comment.post_id.should == @post.id
		  @comment.post.should == @post
		end
	end

	  describe "post associations" do

		before(:each) do
			
		  @post = Post.create(@attr2)
		end

		it "should have a microposts attribute" do
		  @post.should respond_to(:comments)
        end
      end
	  
	  
	  describe "validations" do

		it "should require a user id" do
		  Comment.new(@attr1).should_not be_valid
		end

		it "should require nonblank content" do
		  @post.comments.build(:content => "  ").should_not be_valid
		end
		
		

		
      end
end