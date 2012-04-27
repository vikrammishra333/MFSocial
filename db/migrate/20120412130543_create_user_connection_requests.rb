class CreateUserConnectionRequests < ActiveRecord::Migration
  def change
    create_table :user_connection_requests do |t|
       t.integer  "originating_user_id"
        t.integer  "requested_user_id"
        t.boolean  "accepted"
        t.string   "notes"
        t.datetime "created_at"
        t.datetime "updated_at"
      t.timestamps
    end
  end
end
