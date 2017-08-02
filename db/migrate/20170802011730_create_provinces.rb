class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name  #省份
      t.string :city   #城市

      t.timestamps null: false
    end
  end
end
