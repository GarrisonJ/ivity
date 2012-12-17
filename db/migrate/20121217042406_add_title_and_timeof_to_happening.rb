class AddTitleAndTimeofToHappening < ActiveRecord::Migration
  def change
  	add_column :happenings, :title,  :string
  	add_column :happenings, :time_of, :datetime
  end
end
