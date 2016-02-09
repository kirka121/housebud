class CreateTodoListItems < ActiveRecord::Migration
  def change
    create_table :todo_list_items do |t|
      t.belongs_to :todo_list, index: true
      t.string :description
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
