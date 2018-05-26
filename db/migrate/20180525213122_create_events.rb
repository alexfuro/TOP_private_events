class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :description
      t.string :location
      t.date :event_date
      t.integer :creator_id

      t.timestamps
    end
  end
end
