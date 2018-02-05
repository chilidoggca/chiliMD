module VotesHelper
  def comment_vote(user_vote, comment)
    if !user_vote
      link_1 = link_to fa_icon('angle-up 2x'), comment_votes_path(comment, { is_up: true }),
                             method: :post
      link_2 = link_to fa_icon('angle-down 2x'), comment_votes_path(comment, { is_up: false }),
                             method: :post
    elsif user_vote.is_up?
      link_1 = link_to fa_icon('angle-double-up 2x'), vote_path(user_vote),
                                                   method: :delete
      link_2 = link_to fa_icon('angle-down 2x'), vote_path(user_vote, { is_up: false}),
                                              method: :patch
    else
      link_1 = link_to fa_icon('angle-up 2x'), vote_path(user_vote, { is_up: true }),
                                            method: :patch
      link_2 = link_to fa_icon('angle-double-down 2x'), vote_path(user_vote),
                                                     method: :delete
    end
    "<div class='text-center'>#{link_1}</div>
      <div class='text-center'>#{comment.votes_result}</div>
      <div class='text-center'>#{link_2}</div>"
  end
end
