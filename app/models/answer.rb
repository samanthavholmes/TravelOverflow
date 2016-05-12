class Answer < ActiveRecord::Base
  validates :description, presence: true

  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  def points
    votes.sum(:value)
  end
end
