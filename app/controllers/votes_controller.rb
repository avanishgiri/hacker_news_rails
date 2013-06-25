class VotesController < ApplicationController
  def vote
    vote = Vote.create(value: params[:value])
    post = Post.find(params[:votable_id]) 
    post.votes << vote
    session[:current_user].votes << vote
    render :json => {votecount: post.votecount.to_s}
  end
end
