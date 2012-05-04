class Contact < ActiveRecord::Base
  attr_accessible :current_country, :current_state, :current_town, :current_zip, :home_country, :home_state, :home_zip, :hometown, :mobile_number
end
