class HomeController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_js
  
  def index
    @posts = current_user.recent_posts
    @post = Post.new
    @comment = Comment.new
    render :layout => 'public_profile' 
  end

  def about_us
  end

  def contact
  end

  private

  def load_js
    AssetManager.include_local_library [:application, :upload_image]
    AssetManager.include_css [
      :application, :home
    ]
  end
  
end
