class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :votes, :as => :voteable
  # Remember to create a migration!
end
