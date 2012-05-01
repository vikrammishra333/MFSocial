module LikesHelper

    def current_user_like_check(post_id, id)

      @like = Like.find_by_post_id_and_user_id(:post_id => post_id.to_i, :user_id => id)
       Rails.logger.debug "================================================"
       Rails.logger.debug @like
       Rails.logger.debug "================================================"
      if @like.nil?
        return false
      else
        return true
    end
  end


end
