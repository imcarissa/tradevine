class Bottle < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  validates :content, :title, presence: true
  
end
