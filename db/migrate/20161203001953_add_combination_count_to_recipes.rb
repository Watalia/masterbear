class AddCombinationCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :combinations_count, :integer
  end
end
