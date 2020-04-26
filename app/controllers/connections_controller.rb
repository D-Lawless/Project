class ConnectionsController < ApplicationController


  def index
    @profile = Profile.find(params[:profile_id])
    @connections = @profile.user.connections.all
  end


  def new
    @event = Event.find(params[:event_id])
    @eventgroup = @event.event_group
    # @user = current_user if current
    @group_member = GroupMember.create!(event_group_id: @eventgroup.id, user_id: current_user.id, is_admin: false)
    respond_to do |format|
      if @group_member.save
        format.html { redirect_to event_group_members_path(@eventgroup), notice: 'Group member was successfully created.' }
        format.json { render :show, status: :created, location: @group_member }
      else
        format.html { render :new }
        format.json { render json: event_group_members.errors, status: :unprocessable_entity }
      end
    end
  end




end
