Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root :to => "recipes#index"


  get "/masterbear", :controller => "sessions", :action => "index"
  get "/add_ingredients/:num", :controller => "sessions", :action => "add_ingredients"

  # Routes for the Category resource:
  # CREATE
  get "/categories/new", :controller => "categories", :action => "new"
  post "/create_category", :controller => "categories", :action => "create"

  # READ
  get "/categories", :controller => "categories", :action => "index"
  get "/categories/:id", :controller => "categories", :action => "show"

  # UPDATE
  get "/categories/:id/edit", :controller => "categories", :action => "edit"
  post "/update_category/:id", :controller => "categories", :action => "update"

  # DELETE
  get "/delete_category/:id", :controller => "categories", :action => "destroy"
  #------------------------------

  # Routes for the Combination resource:
  # CREATE
  get "/combinations/new", :controller => "combinations", :action => "new"
  post "/create_combination", :controller => "combinations", :action => "create"

  # READ
  get "/combinations", :controller => "combinations", :action => "index"
  get "/combinations/:id", :controller => "combinations", :action => "show"

  # UPDATE
  get "/combinations/:id/edit", :controller => "combinations", :action => "edit"
  post "/update_combination/:id", :controller => "combinations", :action => "update"

  # DELETE
  get "/delete_combination/:id", :controller => "combinations", :action => "destroy"
  #------------------------------

  # Routes for the Ingredient resource:
  # CREATE
  get "/ingredients/new", :controller => "ingredients", :action => "new"
  post "/create_ingredient", :controller => "ingredients", :action => "create"

  # READ
  get "/ingredients", :controller => "ingredients", :action => "index"
  get "/ingredients/:id", :controller => "ingredients", :action => "show"

  # UPDATE
  get "/ingredients/:id/edit", :controller => "ingredients", :action => "edit"
  post "/update_ingredient/:id", :controller => "ingredients", :action => "update"

  # DELETE
  get "/delete_ingredient/:id", :controller => "ingredients", :action => "destroy"
  #------------------------------

  # Routes for the Recipe resource:
  # CREATE
  get "/recipes/new", :controller => "recipes", :action => "new"
  post "/create_recipe", :controller => "recipes", :action => "create"

  # READ
  get "/recipes", :controller => "recipes", :action => "index"
  get "/recipes/:id", :controller => "recipes", :action => "show"

  # UPDATE
  get "/recipes/:id/edit", :controller => "recipes", :action => "edit"
  post "/update_recipe/:id", :controller => "recipes", :action => "update"

  # DELETE
  get "/delete_recipe/:id", :controller => "recipes", :action => "destroy"
  #------------------------------


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
