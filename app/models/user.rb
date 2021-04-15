require 'securerandom'

class User < ApplicationRecord
    has_many :bottles
    has_many :reviews
    has_many :reviewed_bottles, through: :reviews, source: :bottle
    has_many :categories, through: :bottles
    
    has_secure_password
    validates :username, :email, presence: true
    
    def self.find_with_omniauth(auth)
        self.find_or_create_by(uid: auth[:uid]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(16)
        end
    end

end
