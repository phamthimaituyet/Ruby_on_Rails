class AddDateOfBirth < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birth, :string
    add_index :users, :birth
  end
end
