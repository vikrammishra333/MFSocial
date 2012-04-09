class HomeController < ApplicationController

  before_filter :authenticate_user!
  def index
  end

  def about_us
  end

  def contact
  end
end
