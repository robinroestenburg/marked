class PostsController < ApplicationController

  def index
    @posts = RetrievesPosts.all
  end

  def destroy
    post = Post.find(params[:id])
    if post
      post.destroy
      flash[:notice] = "Post has been depublished."
    end

    redirect_to posts_url
  end

  def new
    @post = Post.new(title: params[:title])
  end

end
