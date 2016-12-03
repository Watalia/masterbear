class ChangeIntructionsDefaultValueInRecipes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :recipes, :intructions, 'Instructions'
  end
end
