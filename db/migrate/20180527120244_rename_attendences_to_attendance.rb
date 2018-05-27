class RenameAttendencesToAttendance < ActiveRecord::Migration[5.1]
  def change
    rename_table :attendences, :attendances
  end
end
