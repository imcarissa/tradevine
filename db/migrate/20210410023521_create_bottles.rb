class CreateBottles < ActiveRecord::Migration[6.1]
  def change
    create_table :bottles do |t|
      t.string :wine_name
      t.string :wine_type
      t.integer :vintage
      t.string :region
      t.string :t_notes
      t.string :comments
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
