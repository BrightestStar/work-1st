class CreateDictionars < ActiveRecord::Migration
  def change
    create_table :dictionars do |t|
      t.integer :location_id
      t.integer :province_id

      t.timestamps null: false
    end
  end
end
