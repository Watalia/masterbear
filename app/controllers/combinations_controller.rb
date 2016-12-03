class CombinationsController < ApplicationController
  def index
    @q = Combination.ransack(params[:q])
    @combinations = @q.result(:distinct => true).includes(:recipe, :ingredient).page(params[:page]).per(10)

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

    @combination.recipe_id = params[:recipe_id]
    @combination.ingredient_id = params[:ingredient_id]

    save_status = @combination.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/combinations/new", "/create_combination"
        redirect_to("/combinations")
      else
        redirect_back(:fallback_location => "/", :notice => "Combination created successfully.")
      end
    else
      render("combinations/new.html.erb")
    end
  end

  def edit
    @combination = Combination.find(params[:id])

    render("combinations/edit.html.erb")
  end

  def update
    @combination = Combination.find(params[:id])

    @combination.recipe_id = params[:recipe_id]
    @combination.ingredient_id = params[:ingredient_id]

    save_status = @combination.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/combinations/#{@combination.id}/edit", "/update_combination"
        redirect_to("/combinations/#{@combination.id}", :notice => "Combination updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Combination updated successfully.")
      end
    else
      render("combinations/edit.html.erb")
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
