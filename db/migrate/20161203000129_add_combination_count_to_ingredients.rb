class AddCombinationCountToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :combinations_count, :integer
  end
end
