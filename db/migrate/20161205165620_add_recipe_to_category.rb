class AddRecipeToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :recipe_id, :integer

  end
end
