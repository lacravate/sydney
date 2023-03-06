class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :author
      t.integer :rate
      t.string :difficulty
      t.string :budget
      t.string :prep_time
      t.string :total_time
      t.integer :people_quantity
      t.text :searchable_ingredients
      t.string :name
      t.string :cook_time

      t.timestamps
    end
  end
end
