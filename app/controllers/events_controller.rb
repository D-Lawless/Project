class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    # @posts = @event.posts.all.order("created_at DESC")
    @post = Post.new
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


end
