class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.belongs_to :board, index: true
      t.string :position, required: true
      t.string :title, required: true
      t.text :description, required: true
      t.string :status, required: true
      t.date :due_date, null: true
      t.date :completed_date, null: true
      t.timestamps null: false
    end
  end

  def down
    drop_table :tasks
  end
end
