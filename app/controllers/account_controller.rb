class AccountController < ApplicationController

  before_filter :authenticate_user!

end
