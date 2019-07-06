class AddAdministratorIdToOperations < ActiveRecord::Migration[5.1]
  def change
    add_column :operations, :administrator_id, :integer
  end
end
