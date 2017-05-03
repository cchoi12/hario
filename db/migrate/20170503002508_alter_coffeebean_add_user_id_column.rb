class AlterCoffeebeanAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :coffeebeans, :user_id, :integer
    add_index :coffeebeans, :user_id
  end
end
