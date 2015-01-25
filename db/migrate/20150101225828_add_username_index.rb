class AddUsernameIndex < ActiveRecord::Migration
  def up
    add_index(:users, :username, unique: true)
    add_index(:users, :email, unique: true)
  end

  def down
    drop_index(:users, :username)
    drop_index(:users, :email)  
  end

end
