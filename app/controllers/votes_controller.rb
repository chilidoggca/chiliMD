class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    c = Comment.find params[:comment_id]
    vote = Vote.new(user: current_user, comment: c, is_up: params[:is_up])
    if !can?(:vote, c)
      redirect_to c.commentable, notice: 'Sorry, you cannot vote on your own comment.'
    elsif vote.save
      redirect_to c.commentable, notice: 'Thank you for voting.'
    else
      redirect_to c.commentable, notice: 'Sorry, your vote was unsuccessful.'
    end
  end

  def update
    vote = Vote.find params[:id]
    vote.update({is_up: params[:is_up]})
    redirect_to vote.comment.commentable, notice: 'Your vote was updated.'
  end

  def destroy
    vote = Vote.find params[:id]
    vote.destroy
    redirect_to vote.comment.commentable, notice: 'Your vote was removed.'
  end

end
