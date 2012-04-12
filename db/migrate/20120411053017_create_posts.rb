class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :by_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
