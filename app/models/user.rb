class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  # has_many :recieved_answers, through: :questions, class_name: 'Answer'
  # has_many :recieved_comments, through: :commentable, class_name: 'Answer'

  # has_many :authored_comments, class_name: 'Comment', :as => :commentable
  # has_many :authored_answers, class_name: 'Answer'

  # has_many :responders, through: :recieved_answers, source: :User
  # has_many :commenters, through: :recieved_comments, source: :User
  has_many :votes, :as => :voteable

end
