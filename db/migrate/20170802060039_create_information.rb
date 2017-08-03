class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :location_id #布署位置id
      t.integer :province_id #省份id
      t.datetime :date #上传日期
      t.string :attachment #单个附件
      t.integer :user_id #用户

      t.timestamps null: false
    end
  end
end
