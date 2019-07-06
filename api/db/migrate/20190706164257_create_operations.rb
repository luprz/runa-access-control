class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.integer :status, default: 0
      t.integer :employee_id

      t.timestamps
    end
  end
end
