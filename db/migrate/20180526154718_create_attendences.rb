class CreateAttendences < ActiveRecord::Migration[5.1]
  def change
    create_table :attendences do |t|
      t.integer :attended_event_id, index: true
      t.integer :attendee_id, index: true

      t.timestamps
    end
  end
end
