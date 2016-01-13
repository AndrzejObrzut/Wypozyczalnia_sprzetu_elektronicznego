class CreateAnnouncements < ActiveRecord::Migration
  def up
    create_table :announcements do |t|
      t.integer  "announcement_category_id"
      t.integer  "user_id"
      t.string "title", :limit => 100, :null => false
      t.text "description", :null => false
      t.integer "price_per_hour", :null => false
      t.integer "price_per_day", :null => true
      t.timestamps null: false
    end
    add_index("announcements", "announcement_category_id")
    add_index("announcements", "user_id")


  end

  def down
    drop_table :announcements
  end
end
