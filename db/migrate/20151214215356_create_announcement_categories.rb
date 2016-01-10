class CreateAnnouncementCategories < ActiveRecord::Migration
  def up
    create_table :announcement_categories do |t|
      t.string "name", :null=>false
      t.attachment :image
      t.timestamps null: false
    end
  end

  def down
    drop_table :announcement_categories
  end
end
