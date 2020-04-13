class CommentsController < ApplicationController



  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

end
