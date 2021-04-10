class User < ApplicationRecord
    has_many :bottles
    has_many :reviews
    has_many :reviewed_posts, through: :reviews, source: :bottle
    has_many :categories, through: :bottles
end
