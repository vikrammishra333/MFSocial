require 'factory_girl'

Factory.define :user do |f|
  f.sequence(:first_name) { |n| "first_name#{n}" }
  f.sequence(:last_name) { |n| "last_name#{n}" }
  f.sequence(:email) { |n| "email#{n}@google.com" }
  f.password               "password"
  f.password_confirmation { |u| u.password }
end

#Factory.define :group do |f|
#  f.name "myGroup"
#  f.sequence(:private_email) { |n| "myGroup#{n}" }
#end

Factory.define :permission do |f|
  f.role_id         1
  #f.association :group, :factory => :group
  f.association :creator, :factory => :user
end
