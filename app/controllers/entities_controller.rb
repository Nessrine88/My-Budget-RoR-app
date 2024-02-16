class EntitiesController < ApplicationController
  before_action :set_group, only: %i[show index new create destroy]
  before_action :authenticate_user!

  def index
    @entities = @group.entities.includes(:user).order(created_at: :desc).page(params[:page])
    @total_amount = total_amount(@entities)
  end

  def show
    @entity = Entity.find(params[:id])
  end

  def new
    @entity = @group.entities.build
    @entity.user_id = current_user.id
  end

  def create
    @entity = @group.entities.build(entity_params)
    @entity.user_id = current_user.id
    if @entity.save
      redirect_to group_entities_path(@group), notice: 'Entity was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy
    redirect_to group_entities_path(@group), notice: 'Entity was successfully destroyed.'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id, :user_id)
  end
end
