class Comment < ActiveRecord::Base
  attr_accessible :content, :parent_id, :post_id, :user_id

  has_many :likes
  belongs_to :user
  belongs_to :post

end
