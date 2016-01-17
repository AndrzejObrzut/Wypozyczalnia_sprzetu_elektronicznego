class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "user_name", :limit=>30,  :null=>false
      t.string "password_digest"
      t.string "first_name", :limit=>40, :null=>false
      t.string "last_name", :limit=>40, :null=>false
      t.string "email", :limit=>60, :null=>false
      t.string "phone", :null=>false
      t.date "birth_date", :null=>false
      t.boolean "is_admin", :default=>false
      t.boolean "regulations_accepted"
      t.timestamps null: false
    end
    add_index("users", "email")
    add_index("users", "user_name")
  end

  def down
    drop_table :users
  end
end
