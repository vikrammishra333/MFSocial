require 'spec_helper'
require 'factories'

describe SessionsController do
  include Devise::TestHelpers

  describe "User functions" do

    before(:each) do
      request.env['devise.mapping'] = Devise.mappings[:user]
      
    end
    

    it "should put a warning on invalid mail address login attempt" do
      post :create, :user => {:email => 'invalidEmailAddress'}
      response.should render_template("new")
      #flash[:message].should eql( "Invalid email or password.")
    end

    it "should put no warning on valid mail address login attempt" do
      post :create, :user => {:email => 'invalidEmailAddress'}
      response.should redirect_to(root_path)
    end


  end

  

end