class PostsController < ApplicationController

  def index
    @posts = RetrievesPosts.all
  end

  def new
    @post = Post.new(title: params[:title])
  end

  def create
    post = Post.new(params[:post])
    post.save
    flash[:notice] = 'Post succesfully published.'
    redirect_to marked_blog.posts_path
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
