class UserConnectionRequest < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :originating_user, :class_name => 'User', :foreign_key => 'originating_user_id'
  belongs_to :requested_user, :class_name => 'User', :foreign_key => 'requested_user_id'
  before_save :check_acceptance

  def check_acceptance
    if accepted
      uc = UserConnection.find_by_user_id_and_connected_user_id originating_user_id, requested_user_id
      if uc.nil?
        UserConnection.create :user => originating_user, :connected_user => requested_user
        UserConnection.create :user => requested_user, :connected_user => originating_user
      end
    end
  end


  def self.check_user_connection_requests(results, current_user)
    @refine_results = Array.new
    if !results.nil?
      results.each do |element|
        @refine_results << element if check_if_request_persist(element, current_user) && check_if_connection_persist(element, current_user)
      end
    end
    return @refine_results
  end

  # Checking whether there is a record in user_connection_requests table
  # Checking if current user originated the request to the stranger
  # or stranger originated the request to the current user
  # if present the return false
  def self.check_if_request_persist(element,current_user)
    @request1 = self.find(:all, :conditions => {:originating_user_id => current_user.id, :requested_user_id => element.id })
    @request2 = self.find(:all, :conditions => {:originating_user_id => element.id, :requested_user_id => current_user.id })

    @status1, @status2 = false, false

    @status1 = true if @request1.blank?
    @status2 = true if @request2.blank?

    return @status1 && @status2

  end

  #Checking if there is any connections persists between two providers
  #This is searching in user_connections table with UserConnection model
  def self.check_if_connection_persist(element, current_user)
    @connected_obj1 = UserConnection.find(:all, :conditions => {:user_id => current_user.id, :connected_user_id => element.id })
    @connected_obj2 = UserConnection.find(:all, :conditions => {:user_id => element.id, :connected_user_id => current_user.id })
    @status1, @status2 = false, false

    @status1 = true if @connected_obj1.blank?
    @status2 = true if @connected_obj2.blank?

    return @status1 && @status2
  end

  #Checking for pending request
  def self.check_pending_request(stranger, current_user)
    @request1 = self.find(:all, :conditions => {:originating_user_id => current_user.id, :requested_user_id => stranger.id })
    @request2 = self.find(:all, :conditions => {:originating_user_id => stranger.id, :requested_user_id => current_user.id })



    if !@request1.blank?
      return @request1.first.accepted
    elsif !@request2.blank?
      return @request2.first.accepted
    else
      return true
    end

  end
end
