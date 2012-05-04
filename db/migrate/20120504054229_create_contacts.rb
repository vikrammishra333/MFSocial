class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :hometown
      t.string :home_state
      t.string :home_country
      t.string :home_zip
      t.string :current_town
      t.string :current_state
      t.string :current_country
      t.string :current_zip
      t.string :mobile_number

      t.timestamps
    end
  end
end
