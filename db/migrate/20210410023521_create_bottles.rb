class CreateBottles < ActiveRecord::Migration[6.1]
  def change
    create_table :bottles do |t|
      t.string :wine_name
      t.string :region
      t.string :description
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
