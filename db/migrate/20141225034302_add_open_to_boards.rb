class AddOpenToBoards < ActiveRecord::Migration
  def up
    add_column :boards, :open, :boolean, required: :true, default: true
  end

  def down
    drop_column :boards, :open
  end
end
