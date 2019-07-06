class AddNoteToOperations < ActiveRecord::Migration[5.1]
  def change
    add_column :operations, :note, :text
  end
end
