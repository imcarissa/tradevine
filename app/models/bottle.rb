class Bottle < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews
  validates :wine_name, :vintage, :winery, :region, :description, presence: true
  accepts_nested_attributes_for :category

  scope :alpha, -> { order(:wine_name) }
 # scope :cannot_review, -> ((where("'user_id != current_user"))}
 # scope :can_review, ->(user) { where.not(id: current_user)}
 # scope :most_comments, -> joins(:reviews).group('bottles.id').order('count(bottles.id) desc')


  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end

end
