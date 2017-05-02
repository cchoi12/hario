class CreateCoffeebeans < ActiveRecord::Migration[5.0]
  def change
    create_table :coffeebeans do |t|

      t.timestamps
    end
  end
end
