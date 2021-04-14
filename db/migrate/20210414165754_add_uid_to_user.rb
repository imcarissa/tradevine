class AddUidToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :numeric
  end
end
