class Bottle < ApplicationRecord
  belongs_to :users
  has_many :reviews
  has_many :users, through: :reviews
end
