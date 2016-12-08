class RecipesController < ApplicationController
  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(:distinct => true).includes(:combinations, :ingredients).page(params[:page]).per(10)
    @recipe = Recipe.new
    @combinations = Combination.all

    render("recipes/index.html.erb")
  end

  def show
    @combination = Combination.new
    @recipe = Recipe.find(params[:id])

    render("recipes/show.html.erb")
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @combination = Combination.new
    @combinations = Combination.all

    render("recipes/new.html.erb")
  end

  def create
    @combination = Combination.new

    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.intructions = params[:intructions]
    @recipe.difficulty = params[:difficulty]
    @recipe.image = params[:image]
    @recipe.category_id = params[:category_id]

    save_status = @recipe.save

    if save_status==true

    redirect_to("/add_ingredients/#{@recipe.id}", :notice => "Intructions added correctly, please add ingredients")

    else

      redirect_to("/recipes/new", :notice => "Something went wrong. Please try again. ")

    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.all
    @ingredients = Ingredient.all

    render("recipes/edit.html.erb")
  end

  def update

    @recipe = Recipe.find(params[:id])

    @recipe.name = params[:name]
    @recipe.intructions = params[:intructions]
    @recipe.difficulty = params[:difficulty]
    @recipe.image = params[:image]
    @recipe.category_id = params[:category_id]

    save_status = @recipe.save

    if save_status==true

      redirect_to("/update_ingredients/#{@recipe.id}", :notice => "Instructions updated successfully. Please edit ingredients.")

    else

      redirect_to("/recipes/#{@recipe.id}/edit", :notice => "Something went wrong. Please try again. ")

    end

  end

    def destroy
      @recipe = Recipe.find(params[:id])
      @recipe.destroy

      if URI(request.referer).path == "/recipes/#{@recipe.id}"
        redirect_to("/", :notice => "Recipe deleted.")
      else
        redirect_back(:fallback_location => "/", :notice => "Recipe deleted.")
      end
    end

    def list
      @q = Recipe.ransack(params[:q])
      @recipes = @q.result(:distinct => true).includes(:combinations, :ingredients).page(params[:page]).per(10)
      @recipe = Recipe.new
      render("/list.html.erb")
    end

end
