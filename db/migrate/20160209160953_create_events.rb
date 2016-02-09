class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :color_code
      t.boolean :all_day

      t.timestamps null: false
    end
  end
end
