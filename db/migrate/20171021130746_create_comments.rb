class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :score, default: 0
      t.belongs_to :post, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.references :parent, index: true
      t.timestamps
    end
  end
end
