class AddColumnToReadings < ActiveRecord::Migration
  def change
    add_reference :readings, :user, index: true
  end
end
