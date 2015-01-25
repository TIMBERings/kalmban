class AddPositionToBoards < ActiveRecord::Migration
  def up
    add_column :boards, :position, :integer
  end

  def down
    dropo column boards, :position
  end
end
