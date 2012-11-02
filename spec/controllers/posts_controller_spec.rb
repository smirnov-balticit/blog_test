require 'spec_helper'

describe PostsController do
  
  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = {:ptitle => "", :content => "" }
      end

      it "should not create a post" do
        lambda do
          post :create, :post => @attr
        end.should_not change(Post, :count)
      end

    end

    describe "success" do

      before(:each) do
        @attr = {:ptitle => "Hello", :content => "How are yoy" }
      end

      it "should create a post" do
        lambda do
          post :create, :post => @attr
        end.should change(Post, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :post => @attr
        response.should redirect_to(root_path)
      end
	 end
  end
  

end