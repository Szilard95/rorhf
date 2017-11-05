class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.references :user
      t.references :item, polymorphic: true
      t.timestamps
    end
  end
end
