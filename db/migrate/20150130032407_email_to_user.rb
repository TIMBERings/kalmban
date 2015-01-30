class EmailToUser < ActiveRecord::Migration
  def up
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    rename_column :users, :name, :first_name

  end

  def down
    remove_column :users, :last_name
    remove_column :users, :email
    rename_column :users, :first_name, :name
  end
end
