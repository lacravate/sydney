class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show ]

  def index
    @recipes = if params[:ingredients].present?
      Recipe.with_ingredients(ingredients).limit(26).order('rate desc', 'name asc')
    else
      []
    end
  end

  def show; end

  private

  def set_recipe
    @recipe = Recipe.find params[:id]
  end

  def ingredients
    @ingredients ||= params[:ingredients].split(/\s*,\s*/).map(&:strip)
  end
end
