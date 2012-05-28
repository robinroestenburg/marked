require 'spec_helper'

describe PostsController do

  context "viewing list of posts" do

    describe "GET index" do

      it "retrieves all posts" do
        # Stub out the call to Dir which retrieves the files from the
        # filesystem.
        RetrievesPosts.
          should_receive(:all).
          and_return([stub])

        get :index
      end

      it "assigns the posts to @posts" do
        foo = stub
        RetrievesPosts.
          stub(:all).
          and_return([foo])

        get :index
        assigns(:posts).should include(foo)
      end

      it "renders the index template" do
        get :index
        response.should render_template(:index)
      end

    end

  end
end
