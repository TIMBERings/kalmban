class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name, limit: 25, required: true
      t.string :last_name, limit: 50, required: true
      t.string :email, required: true
      t.string :username, required: true
      t.string :password_digest, required: true
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
