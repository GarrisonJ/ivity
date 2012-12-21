class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :happening_id
      t.timestamps
    end
    add_index :favorites, [:user_id, :happening_id]
  end
end
