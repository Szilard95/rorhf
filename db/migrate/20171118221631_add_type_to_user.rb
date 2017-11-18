class AddTypeToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :account_type, :string, default: 'user'
  end

  def down
    remove_column :users, :type
  end
end
