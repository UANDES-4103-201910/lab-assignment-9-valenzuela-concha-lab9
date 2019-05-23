class CreateShoppingBags < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_bags do |t|
      t.references :user_ticket, foreign_key: true

      t.timestamps
    end
  end
end
