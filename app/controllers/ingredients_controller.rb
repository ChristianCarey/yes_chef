class IngredientsController < ApplicationController
  def index
    @ingredients = current_user.ingredients.to_a
    @ingredient = current_user.ingredients.build
  end

  def create
    @ingredient = current_user.ingredients.build(whitelist)
    if @ingredient.save
      flash[:success] = "Ingredient created."
      redirect_to ingredients_path
    else
      flash[:danger] = "Could not create ingredient."
      redirect_to ingredients_path
    end
  end

  private

  def whitelist
    params.require(:ingredient).permit(:name)
  end
end
