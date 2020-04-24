class GroupMembersController < ApplicationController
  before_action :set_group_member, only: [:show, :edit, :update, :destroy]


  def index
    @group_members = GroupMember.all.order("created_at DESC")
  end


  def create
    @event = Event.find(params[:event_id])
    @eventgroup = @event.event_group
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

  # PATCH/PUT /group_members/1
  # PATCH/PUT /group_members/1.json
  def update
    respond_to do |format|
      if @group_member.update(group_member_params)
        format.html { redirect_to @group_member, notice: 'Group member was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_member }
      else
        format.html { render :edit }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_members/1
  # DELETE /group_members/1.json
  def destroy
    @group_member.destroy
    respond_to do |format|
      format.html { redirect_to group_members_url, notice: 'Group member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upgrade
    @group_members = GroupMember.find_by(id: params[:id])
    @group_members.update_attribute(:is_admin, true)
    redirect_to event_group_members_path(@group_members)
  end

  def downgrade
    @group_members = GroupMember.find_by(id: params[:id])
    @group_members.update_attribute(:is_admin, false)
    redirect_to event_group_members_path(@group_members)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_member
      @group_member = GroupMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_member_params
      params.require(:group_member).permit(:user_id, :event_id, :is_admin)
    end
end
