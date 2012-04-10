class HomeController < ApplicationController

  before_filter :authenticate_user!
  def index
   render :layout => 'public_profile'
  end

  def about_us
  end

  def contact
  end
end
