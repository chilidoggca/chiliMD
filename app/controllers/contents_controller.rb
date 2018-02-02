class ContentsController < ApplicationController
  def index
    @contents = Post.all.to_a.concat(Medium.all).order(created_at: :desc)
    self.media.to_a.concat(self.posts).sort{|x,y|y.created_at - x.created_at}
  end
end
