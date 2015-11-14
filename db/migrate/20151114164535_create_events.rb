class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.integer :user_id, null:false
      t.string :title, null:false
      t.string :description, null:false
      t.integer :person_count_cap, null:false
      t.decimal  :latitude, :precision => 15, :scale => 10, null:false
      t.decimal  :longitude, :precision => 15, :scale => 10,null:false
      t.timestamps null: false
    end
  end
end
