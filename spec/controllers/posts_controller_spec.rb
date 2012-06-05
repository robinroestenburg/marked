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


  describe "GET new" do

    it "assigns a new post to @post" do
      foo = stub
      Post.stub(:new) { foo }

      get :new
      assigns(:post).should == foo
    end

    it "assigns the title selected post to @post" do
      get :new, :title => "foo"
      assigns(:post).title.should == "foo"
    end

    it "renders the new template" do
      get :new
      response.should render_template(:new)
    end
  end

  describe "POST create" do

    context "with succesful publication" do

      it "saves the post" do
        expect {
          post :create, "post" => { "title"            => "Foo",
                                    "author"           => "Bar",
                                    "tags"             => "foo bar",
                                    "published_at(1i)" => "2000",
                                    "published_at(2i)" => "1",
                                    "published_at(3i)" => "1",
                                    "published_at(4i)" => "13",
                                    "published_at(5i)" => "37" }
        }.to change { Post.all.count }.by(1)
      end

      it "redirects to the index page" do
        post :create
        response.should redirect_to('http://test.host/blog_admin/posts')
      end

      it "sets a flash message" do
        post :create
        flash[:notice].should =~ /Post succesfully published/
      end

    end
  end
end


