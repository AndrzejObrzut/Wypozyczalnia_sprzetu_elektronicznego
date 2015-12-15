class CreateGalleries < ActiveRecord::Migration
  def up
    create_table :galleries do |t|
      t.string "name", :null=>false
      t.boolean "visible", :default=>false
      t.timestamps null: false
    end
  end

  def down
    drop_table :galleries
  end
end
