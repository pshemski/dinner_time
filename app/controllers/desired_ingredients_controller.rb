class DesiredIngredientsController < ApplicationController
  def new
    @desired_ingredient = DesiredIngredient.new
    if current_pot.desired_ingredients.any?
      @most_relevant_recipes = current_pot.most_relevant_recipes_only.first(20)
    end
  end

  def create
    finder = current_pot_or_create
    @desired_ingredient = finder.desired_ingredients.find_or_create_by(desired_ingredient_params)
    redirect_to new_desired_ingredient_path
  end

  def clear_pot
    session[:finder_id] = nil
    redirect_to new_desired_ingredient_path
  end

  private

  def desired_ingredient_params
    params.require(:desired_ingredient).permit(:name)
  end
end
