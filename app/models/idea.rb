class Idea < ApplicationRecord
  validates :content, presence: true

  belongs_to :category
  belongs_to :user

  has_many :idea_images, dependent: :destroy
  has_many :images, through: :idea_images
end
