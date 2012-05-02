
class CreateAccountPhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :photos, :user_id
  end
end
