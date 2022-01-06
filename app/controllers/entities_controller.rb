class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entity = Entity.new
  end

  def create
    @entity = current_user.entities.new(entity_params)

    if @entity.save
      @group_entity = @entity.group_entities.create(group_entity_params)
      redirect_to group_path(@group_entity.group_id), notice: 'Transaction successful'
    else
      flash[:alert] = @entity.errors.full_messages.first
      render :new
    end
  end

  def completed; end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end

  def group_entity_params
    params.require(:entity).permit(:group_id)
  end
end
