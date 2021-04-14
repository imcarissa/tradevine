class User < ApplicationRecord
    has_many :bottles
    has_many :reviews
    has_many :reviewed_bottles, through: :reviews, source: :bottle
    has_many :categories, through: :bottles

    has_secure_password

    def self.find_with_omniauth(auth)
        binding.pry
    end


end
