class CreateCombinations < ActiveRecord::Migration
  def change
    create_table :combinations do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps

    end
  end
end
