class UserConnection < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :connected_user, :class_name => 'User', :foreign_key => 'connected_user_id'
end
