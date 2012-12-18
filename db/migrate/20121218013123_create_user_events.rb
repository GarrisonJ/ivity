class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.integer :user_id
      t.integer :happening_id
      t.timestamps
    end
    add_index :user_events, [:user_id, :happening_id]
  end
end
