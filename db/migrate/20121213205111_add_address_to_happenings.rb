class AddAddressToHappenings < ActiveRecord::Migration
  def change
  	add_column :happenings, :address, :string
  end
end
