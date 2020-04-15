class PostsController < ApplicationController

  # before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  # def create
  #   @event =
  #   @post = current_user.events.post.build(post_params)
  # end

  def show

    @post = Post.find(params[:id])

  end

  def create

    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.event_id = @event.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { redirect_to @event, notice: 'Event was NOT successfully created.' }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end


# def create
#   @event = current_user.events.build(event_params)
#
#   respond_to do |format|
#     if @event.save
#
#       format.html { redirect_to root_path, notice: 'Event was successfully created.' }
#       format.json { render :show, status: :created, location: @event }
#     else
#       format.html { render :new }
#       format.json { render json: @event.errors, status: :unprocessable_entity }
#     end
#   end
# end
#
