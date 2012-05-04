class CreateWorkAndEducations < ActiveRecord::Migration
  def change
    create_table :work_and_educations do |t|
      t.string :secondary_school
      t.string :sr_secondary_school
      t.string :college
      t.string :university
      t.string :current_employer
      t.string :previous_employer

      t.timestamps
    end
  end
end
