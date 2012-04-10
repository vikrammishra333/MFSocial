class HomeController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    render :layout=> 'profile'
  end

  def about_us
  end

  def contact
  end
end
