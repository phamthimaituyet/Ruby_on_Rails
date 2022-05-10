class AddStatusToGroupMember < ActiveRecord::Migration[6.1]
  def change
    add_column :group_members, :status, :boolean
  end
end
