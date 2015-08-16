class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.timestamp :date
      t.float :reading_cf

      t.timestamps null: false
    end
  end
end
