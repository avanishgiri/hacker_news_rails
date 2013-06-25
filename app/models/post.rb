class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :user
  has_many :votes, :as => :votable
  attr_accessible :title, :text
  def votecount
    self.votes.inject(0) { |res, v| res + v.value }
  end
end
