class AddColumnsToBottles < ActiveRecord::Migration[6.1]
  def change
    add_column :bottles, :vintage, :integer
    add_column :bottles, :winery, :string
  end
end
