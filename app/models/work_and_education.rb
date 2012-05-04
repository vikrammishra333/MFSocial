class WorkAndEducation < ActiveRecord::Base
  attr_accessible :college, :current_employer, :previous_employer, :secondary_school, :sr_secondary_school, :university
end
