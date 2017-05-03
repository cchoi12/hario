class CreateCoffeebeans < ActiveRecord::Migration[5.0]
  def change
    create_table :coffeebeans do |t|
      t.string :name
      t.string :brand
      t.string :roast_type
      t.text :notes
      t.integer :score
      t.datetime :created_at
      t.datetime :best_by
      
      t.timestamps
    end
  end
end
