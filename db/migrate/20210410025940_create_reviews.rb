class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.resources :user
      t.resources :bottle

      t.timestamps
    end
  end
end
