class CreateAnnouncements < ActiveRecord::Migration
  def up
    create_table :announcements do |t|
      t.integer  "announcements_id"
      t.string "title", :limit => 100, :null => false
      t.text "descrption", :null => false
      t.integer "price_per_hour", :null => false
      t.integer "price_per_day", :null => true
      t.integer "positon"
      t.timestamps null: false
    end
    add_index("announcements", "announcements_id")

  end

  def down
    drop_table :announcements
  end
end
