class AddMapsToHappenings < ActiveRecord::Migration
  def change
  	add_column :happenings, :latitude,  :float #you can change the name, see wiki
	add_column :happenings, :longitude, :float #you can change the name, see wiki
	add_column :happenings, :gmaps, :boolean #not mandatory, see wiki
  end
end
