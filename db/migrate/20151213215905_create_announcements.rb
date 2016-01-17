class CreateAnnouncements < ActiveRecord::Migration
  def up
    create_table :announcements do |t|
      t.integer  "announcement_category_id", :null => false
      t.integer  "user_id", :null => false
      t.string "title", :limit => 100, :null => false
      t.text "description", :null => false
      t.integer "price_per_hour", :null => false
      t.integer "price_per_day", :null => false
      t.timestamps :null=>false
    end
    add_foreign_key :announcements, :announcement_categories, on_delete: :cascade
    add_index("announcements", "announcement_category_id")
    add_foreign_key :announcements, :users, on_delete: :cascade
    add_index("announcements", "user_id")


  end

  def down
    drop_table :announcements
  end
end
