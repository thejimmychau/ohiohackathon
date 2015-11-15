class CreateEventTags < ActiveRecord::Migration
  def change
    create_table :event_tags do |t|

      t.string :tag_name,null:false
      t.timestamps null: false
    end
  end
end
