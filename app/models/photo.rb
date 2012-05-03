class Photo < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  
  attr_accessible :description, :title, :user_id, :avtar,:avtar_file_name
 
  has_attached_file :avtar, :styles => {
    :profile => "60x70>",
    :comment => "50x60",
    :new_comment => "35x35"
  }

  validates_attachment :avtar, :presence => true,
  :size => { :in => 0..1.megabytes }
  
end
