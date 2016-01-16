class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.integer "announcement_id"
      t.attachment :image
      t.integer "position"
      t.timestamps null: false
    end
    add_index("photos", "announcement_id")
  end

  def down
    drop_table :photos
  end
end
