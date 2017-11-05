class AddIndexesToSavesAndUpvotes < ActiveRecord::Migration[5.1]
  def change
    add_index :upvotes, [:user_id, :item_id, :item_type], unique: true
    add_index :saves, [:user_id, :post_id], unique: true
  end
end
