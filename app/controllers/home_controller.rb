class HomeController < ApplicationController

  before_filter :authenticate_user!
  def index
<<<<<<< HEAD
    #render :layout=> 'profile'
=======
   render :layout => 'public_profile'
>>>>>>> debadatta
  end

  def about_us
  end

  def contact
  end
end
