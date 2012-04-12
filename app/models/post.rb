class Post < ActiveRecord::Base
  attr_accessible :by_user_id, :content, :to_user_id

  has_many :comments
  has_many :likes
  belongs_to :user, :foreign_key => :by_user_id
  
end
