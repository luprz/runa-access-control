class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.integer :administrator_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
