 class CombinationsController < ApplicationController

  def index
    @q = Combination.ransack(params[:q])
    @combinations = Combination.all
    render("combinations/index.html.erb")
  end

  def show
    @combination = Combination.find(params[:id])
    render("combinations/show.html.erb")
  end

  def new
    @combination = Combination.new
    render("combinations/new.html.erb")
  end

  def create
    @combination = Combination.new
    params[:ingredient_id].each do |i|
      @combination = Combination.new
      @combination.ingredient_id = i
      @combination.recipe_id = params[:recipe_id]
      @combination.save
    end

    @recipe = Recipe.find(params[:num_2])
    redirect_to("/recipes/#{@recipe.id}", :notice => "Your recipe was added succesfully!")
  end


  def edit
    @combination = Combination.find(params[:id])
    render("combinations/edit.html.erb")
  end

  def update

    @save_status=false

    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @combinations = @recipe.combinations
      @combinations.each do |c|
          @combination = c
          @combination.recipe_id = params[:id]
              @ingredients.each do |i|
                  @combination.ingredient_id = i.id
              end

      @save_status = @combination.save
      end

    if @save_status == true
        redirect_to("/recipes", :notice => "Your recipe was edited succesfully!")
    else
        redirect_to("/update_ingrediente/#{@recipe.id}", :notice => "Something went wrong. Please try again.")
    end
  end

  def destroy
    @combination = Combination.find(params[:id])

    @combination.destroy

    if URI(request.referer).path == "/combinations/#{@combination.id}"
      redirect_to("/", :notice => "Combination deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Combination deleted.")
    end
  end

end
