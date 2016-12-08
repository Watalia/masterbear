class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :intructions
      t.string :difficulty
      t.string :image
      t.integer :category_id

      t.timestamps

    end
  end
end
