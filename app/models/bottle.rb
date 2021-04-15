class Bottle < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  validates :content, :title, presence: true

  scope :alpha, -> { order(:wine_name) }
  scope :most_comments, -> joins(:reviews).group(‘bottles.id’).order(‘count(bottles.id) desc’)
  
  def category_attributes(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end

end
