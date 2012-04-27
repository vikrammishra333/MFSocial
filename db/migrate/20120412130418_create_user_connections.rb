class CreateUserConnections < ActiveRecord::Migration
  def change
    create_table :user_connections do |t|
      t.integer  "user_id"
      t.integer  "connected_user_id"
      t.string   "relationship"
      t.string   "status"
      t.text     "notes"
      t.timestamps
    end
  end
end
