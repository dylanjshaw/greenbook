class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :author, class_name: 'User'
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  # Remember to create a migration!
end
