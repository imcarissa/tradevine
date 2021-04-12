class RemoveWineTypeFromBottles < ActiveRecord::Migration[6.1]
  def change
    remove_column :bottles, :wine_type, :string
    remove_column :bottles, :vintage, :integer
    remove_column :bottles, :comments, :string
    remove_column :bottles, :region, :string
  end
end
