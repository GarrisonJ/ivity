class AddUserIdToHappenings < ActiveRecord::Migration
  def change
  	add_column :happenings, :user_id, :integer
  	add_index :happenings, :user_id
  	remove_column :happenings, :name
  end
end
