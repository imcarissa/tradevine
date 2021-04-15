class User < ApplicationRecord
    has_many :bottles
    has_many :reviews
    has_many :reviewed_bottles, through: :reviews, source: :bottle
    has_many :categories, through: :bottles
    
    has_secure_password
    validates :username, :email, presence: true
    
    def self.find_with_omniauth(auth)
     
    end


end
