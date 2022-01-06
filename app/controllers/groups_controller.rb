class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.includes(group_entities: :entity)
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @group_entities = GroupEntity.includes(:group, :entity).where(group_id: params[:id])
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'New category added successfully'
    else
      flash[:alert] = @group.errors.full_messages.first
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
