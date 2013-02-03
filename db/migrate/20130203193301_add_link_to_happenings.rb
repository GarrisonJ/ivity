class AddLinkToHappenings < ActiveRecord::Migration
  def change
  	add_column :happenings, :website, :string
  end
end
