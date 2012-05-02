class Account::Album < ActiveRecord::Base
  attr_accessible :description, :title, :user_id
end
