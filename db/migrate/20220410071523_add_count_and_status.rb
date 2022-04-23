class AddCountAndStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :count_post, :integer
    add_column :users, :status, :boolean, default: true 
  end
end
