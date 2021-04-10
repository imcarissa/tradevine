class AddDescriptionToBottles < ActiveRecord::Migration[6.1]
  def change
    add_column :bottles, :description, :string
  end
end
