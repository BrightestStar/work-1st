class AddImagesToInformation < ActiveRecord::Migration
  def change
    add_column :information, :images, :string
  end
end
