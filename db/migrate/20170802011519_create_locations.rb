class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name   #名称
      t.string :url01  #监控服务地址
      t.string :url02  #队列服务地址
      t.integer :user_id #用户

      t.timestamps null: false
    end
  end
end
