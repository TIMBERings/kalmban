class CreateBoards < ActiveRecord::Migration
  def up
    create_table :boards do |t|
      t.string :title, limit: 100, required:true
      t.text :description
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end

  def down
    drop_table :boards
  end
end
