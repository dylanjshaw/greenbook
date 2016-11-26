class Answer < ActiveRecord::Base
  belongs_to :questions
  belongs_to :author, class_name: 'User'
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  def count_votes
    votes.sum(:value)
  end

end
