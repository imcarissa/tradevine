class Review < ApplicationRecord
    belongs_to :user
    belongs_to :bottle
   
    validates :content, presence: true
    validates :user_id, presence: true
    validates :bottle_id, presence: true

    
end
