class HomeController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_js
  
  def index
    @posts = Post.order("created_at DESC")
    @post = Post.new
    @comment = Comment.new
    respond_to do |format|
      format.html {  render :layout => 'public_profile' }#index.html.erb
      format.json { render json: @posts}
      format.xml
    end
  end

  def about_us
  end

  def contact
  end

  private

  def load_js
    AssetManager.include_local_library [:application, :upload_image]
    AssetManager.include_css [
      :application,
    ]
  end
  
end
