class CreateAnnouncements < ActiveRecord::Migration
  def up
    create_table :announcements do |t|
      t.string "title", :limit => 100, :null => false
      t.date "date_of_start", :null => false
      t.integer "price_per_hour", :null => false
      t.integer "price_per_day", :null => true
      t.timestamps null: false
    end
  end

  def down
    drop_table :announcements
  end
end
