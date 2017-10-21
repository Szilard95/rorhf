class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :body
      t.integer :score
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
