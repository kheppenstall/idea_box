class Image < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  has_many :idea_images
  has_many :ideas, through: :idea_images
end
