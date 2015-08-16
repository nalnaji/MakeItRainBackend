class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :meter_id
      t.integer :fb_id

      t.timestamps null: false
    end
  end
end
