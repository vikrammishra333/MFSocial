class Photo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title, :user_id
end
