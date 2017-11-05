class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
