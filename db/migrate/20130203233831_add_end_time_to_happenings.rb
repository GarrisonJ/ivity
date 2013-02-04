class AddEndTimeToHappenings < ActiveRecord::Migration
  def change
    add_column :happenings, :end_time, :datetime
  end
end
