class SessionsController < ApplicationController

      def index
        @recipes = Recipe.all
        render("sessions/index.html.erb")
      end

      def add_ingredients
        @recipe = Recipe.find(params[:num])
        @ingredients = Ingredient.all
        render("sessions/add_ingredients.html.erb")
      end

      def update_ingredients

        @recipe = Recipe.find(params[:id])
        @ingredients = Ingredient.all

        render("sessions/update_ingredients.html.erb")
      end


end
