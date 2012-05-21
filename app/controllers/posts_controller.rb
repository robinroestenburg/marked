class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def destroy
    post = Post.find(params[:id])
    if post
      post.destroy
      flash[:notice] = "Post has been depublished."
    end

    redirect_to posts_url
  end

end
