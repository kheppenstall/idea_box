class Idea < ApplicationRecord
  validates :content, presence: true

  belongs_to :category
  belongs_to :user
end
