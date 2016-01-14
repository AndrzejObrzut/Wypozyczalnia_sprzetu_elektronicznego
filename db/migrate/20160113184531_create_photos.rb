class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :name,         :null => false
      t.binary :data,         :null => false
      t.string :filename
      t.string :mime_type
      t.integer :size
      t.timestamps
    end
  end

  def down
    drop_table :photos
  end
end
