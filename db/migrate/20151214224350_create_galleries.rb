class CreateGalleries < ActiveRecord::Migration
  def up
    create_table :galleries do |t|
      t.attachment :image
      t.integer  "announcement_id"
      t.timestamps null: false
    end
    add_index("galleries", "announcement_id")
  end

  def down
    drop_table :galleries
  end
end
