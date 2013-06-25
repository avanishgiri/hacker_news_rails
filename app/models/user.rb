class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_many :votes

  attr_accessible :name, :password
end
