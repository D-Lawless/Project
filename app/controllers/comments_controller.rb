class CommentsController < ApplicationController

  before_action :set_params


  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    # @post.event_id = @event.
    # @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @event, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @event, notice: 'Comment was NOT successfully created.' }
      end
    end
  end


  private

  def comment_params
    params.require(:comment).permit( :content)
  end

  def set_params
    @post = Post.find(params[:post_id])
    @event = Event.find(params[:event_id])
  end

end
