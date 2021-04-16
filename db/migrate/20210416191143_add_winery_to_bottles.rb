class AddWineryToBottles < ActiveRecord::Migration[6.1]
  def change
    add_column :bottles, :winery, :string
  end
end
