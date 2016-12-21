class User < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :ideas, dependent: :destroy
  has_secure_password

end
