class HomeController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_js
  
  def index
    @posts = Post.all
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
    AssetManager.include_local_library [:application, :upload_image, :simple_common_functionality]
    AssetManager.include_css [
      :application, :home
    ]
  end
  
end
