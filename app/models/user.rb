class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :gender, :date_of_birth, :first_name, :last_name
  # attr_accessible :title, :body
  # 
  # Makes the current user accessible anywhere in my classes
  cattr_accessor :current_user

  has_many :add_posts, :foreign_key => :by_user_id, :class_name => "Post"
  has_many :receive_posts, :foreign_key => :to_user_id, :class_name => "Post"
  
  has_many :comments, :foreign_key => :user_id
  has_many :likes, :foreign_key => :user_id


  def recent_posts
    @posts = self.add_posts.where("posts.created_at > ?", self.last_sign_in_at )
  end

end
