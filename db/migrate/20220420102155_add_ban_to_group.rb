class AddBanToGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :ban, :boolean, default: true 
  end
end
