class RemoveIsAdminFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :isAdmin, :bool
  end
end
