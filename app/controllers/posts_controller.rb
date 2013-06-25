class PostsController < ApplicationController

  def index
    @user = session[:current_user]
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(params[:post])
    session[:current_user].posts << post
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    Post.find(params[:id]).update_attributes(params[:post])
    redirect_to posts_path
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.destroy(params[:id])
    redirect_to posts_path
  end
end
