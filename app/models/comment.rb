class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :votes, :as => :voteable

  def count_votes
    votes.sum(:value)
  end

end
