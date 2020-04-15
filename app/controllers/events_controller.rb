class EventsController < ApplicationController

  before_action :authenticate_user!


  def show

    @event = Event.find(params[:id])












    # @currentevent = Event.find_by(params[:event_id])
    # @posts = @currentevent.posts.all.order("created_at DESC") #Working
    #
    # @comments = []
    # @posts.each do |post|
    #   tcom = Comment.where(post_id: post.id)
    #   @comments += tcom if tcom
    # end
    #



    # @posts.each do |post|
    #   @comments = post.comments.all.order("created_at DESC")
    # end

#     @/currentevent = Event.find(params[:id])#Working
#
# @/posts = @/currentevent.posts.all.order("created_at DESC") #Working
#
# @/posts.each do |post|
#
#       @/comments = Comment.where(post_id: post.id)
#
# end


    # @currentevent = Event.find(params[:id])#Working
    # @posts = @currentevent.posts.all.order("created_at DESC") #Working
    #
    # @posts.each do |post|
    #   @currentevent = Event.find_by(params[:event_id])#Working
    #   @currentpost = Post.where(post_id: post.id)
    #   @comments = Comment.where(post_id: post.id)
    #   @newcomment = Comment.new #Working
    #
    #
    # end

    #
    # @currentpost = Post.find_by(params[:post_id])
    # @comments = @currentpost.comments.all.order("created_at DESC")

    # @currentevent, @currentpost, @newcomment



    # @currentpost = Post.find_by(params[:post_id]) #Not_Working
    # @comments = @currentpost.comments.all.order("created_at DESC") #Not_Working


    @newpost = Post.new #Working
    @newcomment = Comment.new


  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save

        format.html { redirect_to root_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find_by(params[:event_id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new
    @event = current_user.events.build
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :photo, :roles, :start_dt, :end_dt)
  end

  def set_params

  end


end
