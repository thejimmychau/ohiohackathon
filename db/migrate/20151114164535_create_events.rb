class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.integer :user_id, null:false #user that created this event (host/planner of event)
      t.integer :event_tag_id, null:false
        
        t.datetime :start_time,null:false
        t.datetime :end_time,null:false
        
        t.string :address, null:false
        t.integer :zip_code
        t.string :city, null:false
        t.string :state, null:false
        
      t.decimal  :latitude, :precision => 15, :scale => 10, null:false
      t.decimal  :longitude, :precision => 15, :scale => 10,null:false
        
      t.string :title, null:false
      t.string :description, null:false
      t.integer :person_count_cap, null:false
      t.timestamps null: false
    end
  end
end
