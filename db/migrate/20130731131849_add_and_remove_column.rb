class AddAndRemoveColumn < ActiveRecord::Migration
  def change

  	add_column :estimations , :station_id , :integer

  	remove_column :stations , :estimation_id

  	remove_column :estimations , :estimation_id

  end
end
