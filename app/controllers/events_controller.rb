class EventsController < ApplicationController

  before_action :authenticate_user!


  def show

    @currentevent = Event.find(params[:id])#Working
    @posts = @currentevent.posts.all.order("created_at DESC") #Working

    @currentpost = Post.find_by(params[:post_id]) #Not_Working
    @comments = @currentpost.comments.all.order("created_at DESC") #Not_Working


    @newpost = Post.new #Working
    @newcomment = Comment.new #Working

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
