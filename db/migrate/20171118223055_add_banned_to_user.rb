class AddBannedToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :banned, :boolean, default: false
  end

  def down
    remove_column :users, :banned
  end
end
