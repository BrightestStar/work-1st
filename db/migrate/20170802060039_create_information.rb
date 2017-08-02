class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :location_id
      t.integer :province_id
      t.datetime :date
      t.string :attachment

      t.timestamps null: false
    end
  end
end
