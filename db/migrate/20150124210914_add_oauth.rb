class AddOauth < ActiveRecord::Migration
  def up
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :email
    remove_column :users, :username
    remove_column :users, :password_digest
  end

  def down
    add_column :users, :password_digest, :string, {required: true}
    add_column :users, :username, :string, {required: true}
    add_column :users, :email, :string, {required: true}
    add_column :users, :last_name, :string, {required: true, limit: 50}
    add_column :users, :first_name, :string, {required: true, limit: 25}
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :name
    remove_column :users, :oauth_token
    remove_column :users, :oauth_expires_at
  end
end
