class CommentsController < ApplicationController

  def create
    comment = Comment.create(params[:comment])
    session[:current_user].comments << comment
    Post.find(params[:post_id]).comments << comment
    redirect_to :back
  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end

end
