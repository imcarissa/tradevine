class AddIndexToBottles < ActiveRecord::Migration[6.1]
  def change
    add_index :bottles, :wine_name
  end
end
