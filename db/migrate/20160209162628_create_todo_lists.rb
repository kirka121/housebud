class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.belongs_to :event, index: true
      t.string :title
      t.datetime :duedate
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
