class GroupsController < ApplicationController
    before_action :set_group, only: %i[ show edit update destroy ]
    before_action :authenticate_user!

    # GET /groups or /groups.json
    def index
        @groups = Group.all 
        
        @members = GroupMember.where(user_id: current_user.id)
    end

    # GET /groups/1 or /groups/1.json
    def show
        if @group.ban
            @posts = Post.where(group_id:@group.id)
            @posts = @posts.page(params[:page]).per(3)
        else
            respond_to do |format|
                format.html { redirect_to groups_path, notice: "Group đã bị ban" }
            end
        end
        @members = GroupMember.where(user_id: current_user.id)

        if @group.status == 'private'
            if @members.present?
                @posts = Post.where(group_id:@group.id)
                @posts = @posts.page(params[:page]).per(3)
            else
                respond_to do |format|
                    format.html { redirect_to groups_path, notice: "Group đã bị ban" }
                end
            end
        end
    end

    # GET /groups/new
    def new
        @group = Group.new
    end

    # GET /groups/1/edit
    def edit
    end

    # POST /groups or /groups.json
    def create
        @group = Group.new(group_params)
        @group[:user_create_id] = current_user.id
        @group.group_members.new(user_id: current_user.id)
        respond_to do |format|
            if @group.save
                format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
                format.json { render :show, status: :created, location: @group }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @group.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /groups/1 or /groups/1.json
    def update
        respond_to do |format|
            if @group.update(group_params)
                format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
                format.json { render :show, status: :ok, location: @group }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @group.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /groups/1 or /groups/1.json
    def destroy
        @group.destroy

        respond_to do |format|
            format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    def join_group
        # @member = GroupMember.find_or_initialize_by(user_id: params[:user_id], group_id: params[:group_id])

        @member = GroupMember.find_by(user_id: params[:user_id], group_id: params[:group_id])

        if @member.present?
            success = @member.destroy
        else
            @member = GroupMember.find_or_initialize_by(user_id: params[:user_id], group_id: params[:group_id])
            success = @member.save
        end
        
        respond_to do |format|
            format.json { render json: {success: success} }
        end
    end

    def accept_join_group

        @member = GroupMember.find_by(user_id: params[:user_id], group_id: params[:group_id])
        success = @member.update(group_member_params)
        respond_to do |format|
            format.json { render json: {success: success} }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
    def set_group
        @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
        params.require(:group).permit(:name, :status, :ban)
    end

    def group_member_params
        params.permit(:group_id, :user_id, :status)
    end
end
