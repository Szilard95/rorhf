class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.integer :karma, default: 0
      t.text :about

      t.timestamps
    end
  end
end
