class Bottle < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  validates :wine_name, :vintage, :winery, :region, :description, presence: true
  accepts_nested_attributes_for :category

  scope :alpha, -> { order(:wine_name) }

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end

end
