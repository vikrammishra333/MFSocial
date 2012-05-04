class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :about_you
      t.text :favourite_quotation
      t.string :relationship_status
      t.string :inetrested_in
      t.string :religious_views

      t.timestamps
    end
  end
end
