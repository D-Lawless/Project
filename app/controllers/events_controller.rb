class EventsController < ApplicationController

  before_action :authenticate_user!


  def show

    @event = Event.find(params[:id])
    @members = @event.event_group.group_members.all

    @newpost = Post.new #Working
    @newcomment = Comment.new
    @newmember = GroupMember.new


  end

  def create
    @event = current_user.events.build(event_params)
    respond_to do |format|
      if @event.save
        @eventgroup = EventGroup.create!(event_id: @event.id)
        @groupmember = GroupMember.create!(user_id: current_user.id, event_group_id: @eventgroup.id, is_admin: true)

        format.html { redirect_to event_path(@event), notice: 'Event was successfully created.' }
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
    params.require(:event).permit(:title, :description, :location, :cover_photo, :roles, :start_dt, :end_dt)
  end

  # def group_params
  #   params.require(:event_group).permit(:user_id, :event_id, :is_admin)
  # end

  def set_params

  end


end
