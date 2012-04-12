class Like < ActiveRecord::Base
  attr_accessible :comment_id, :post_id, :user_id

  belongs_to :user
  belongs_to :post
  belongs_to :comment

end
