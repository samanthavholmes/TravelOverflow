class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_secure_password

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes, as: :voteable
end
