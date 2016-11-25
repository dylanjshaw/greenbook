class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :author, class_name: 'User'
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

def count_votes
    votes.pluck(:value).inject(0, :+)
  end

end
