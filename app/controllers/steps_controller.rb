class StepsController < ApplicationController
  before_action :set_step, only: %i[edit update destroy]
  before_action :set_recipe, only: %i[create update]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.recipe = @recipe
    if @step.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit; end

  def update
    @step.update(step_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:description, :recipe_id)
  end
end
